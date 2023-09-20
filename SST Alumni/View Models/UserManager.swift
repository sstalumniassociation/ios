//
//  UserManager.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation
import FirebaseAuth
import Alamofire
import SwiftUI

class UserManager: ObservableObject {
    @Published var user: UserData?
    var firebaseUser: User?
    
    @Published var authenticationState = AuthenticationState.emailInput {
        didSet {
            print(authenticationState)
            switch authenticationState {
            case .lookingUpEmail(let email):
                validateEmail(email)
            case .registeringUser(let email, let password, let cloudflareUserId):
                registerUser(email: email, password: password, cloudflareId: cloudflareUserId)
            case .loggingIn(let email, let password):
                logIn(email: email, password: password)
            default: break
            }
        }
    }
    
    let auth: Auth
    
    init() {
        self.auth = Auth.auth()
        
        auth.addStateDidChangeListener { auth, user in
            if user != nil && self.authenticationState == .authenticated {
                self.firebaseUser = user
            } else {
                self.firebaseUser = nil
            }
        }
    }
    
    func logIn(email: String, password: String) {
        Task {
            do {
                let result = try await auth.signIn(withEmail: email, password: password)
                let user = result.user
                
                let token = try await user.getIDToken()
                
                var request = URLRequest(url: .cfServer.appendingPathComponent("user/\(user.uid)"))
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                
                let (data, _) = try await URLSession.shared.data(for: request)
                
                let decoder = JSONDecoder()
                let userData = try? decoder.decode(UserData.self, from: data)
                
                await MainActor.run {
                    if let userData {
                        withAnimation {
                            self.user = userData
                            authenticationState = .authenticated
                        }
                    } else {
                        authenticationState = .error(.ourFault(description: "Could not get user data."))
                    }
                }
            } catch {
                let error = error as NSError
                
                if error.domain == "FIRAuthErrorDomain" {
                    await MainActor.run {
                        var authError: AuthErrorHandle = .fromFirebaseAccount(error.code) ?? AuthErrorHandle(icon: "pc", title: "Error Logging In", description: "An unknown error occurred.")
                        
                        if authError == .internalError {
                            authError = .wrongPassword
                        }
                        
                        if authError == .wrongPassword || authError == .internalError {
                            authenticationState = .incorrectPassword(email)
                        } else {
                            authenticationState = .error(authError)
                        }
                    }
                } else {
                    let authError: AuthErrorHandle = AuthErrorHandle(icon: "pc", title: "Error Logging In", description: "An unknown error occurred.")
                    
                    await MainActor.run {
                        authenticationState = .error(authError)
                    }
                }
            }
        }
    }
    
    func validateEmail(_ email: String) {
        Task {
            let authState: AuthenticationState
            
            var request = URLRequest(url: .cfServer.appendingPathComponent("auth/verify/"))
            request.httpMethod = "POST"
            
            let dict = ["email": email]
            let dataToSend = try JSONSerialization.data(withJSONObject: dict, options: [.fragmentsAllowed])
            
            request.httpBody = dataToSend
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else { return }
            
            switch response.statusCode {
            case 400...499:
                authState = .unregistered
            case 500...599: 
                authState = .error(.ourFault(icon: "server.rack", title: "Internal Server Error", description: "This is our fault. Probably."))
            case 200...299:
                if let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let cloudflareUserId = jsonData["id"] as? String,
                   let isLinked = jsonData["linked"] as? Bool {
                    if isLinked {
                        authState = .logInPassword(email)
                    } else {
                        authState = .registerPassword(email, cloudflareUserId)
                    }
                } else {
                    authState = .error(.ourFault(icon: "doc", description: "Could not decode returned data."))
                }
            default:
                authState = .error(.ourFault(title: "That’s unexpected.", description: "Something has gone horribly wrong.\nPlease contact us."))
            }
            
            await MainActor.run {
                authenticationState = authState
            }
        }
    }
    
    func registerUser(email: String, password: String, cloudflareId: String) {
        Task {
            do {
                let authDataResult = try await auth.createUser(withEmail: email, password: password)
                let user = authDataResult.user
                let firebaseUserId = user.uid
                
                var request = URLRequest(url: .cfServer.appendingPathComponent("user/\(cloudflareId)/"))
                request.httpMethod = "POST"
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                
                let dict = ["firebaseId": firebaseUserId]
                let dataToSend = try JSONSerialization.data(withJSONObject: dict, options: [.fragmentsAllowed])
                
                request.httpBody = dataToSend
                
                let token = try await user.getIDToken()
                request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                
                let (data, response) = try await URLSession.shared.data(for: request)
                guard let response = response as? HTTPURLResponse else { return }
                
                if 200...299 ~= response.statusCode {
                    let decoder = JSONDecoder()
                    let user = try? decoder.decode(UserData.self, from: data)
                    
                    await MainActor.run {
                        if let user {
                            authenticationState = .verifyEmailAddress
                            self.user = user
                        } else {
                            authenticationState = .error(.ourFault(icon: "doc", description: "Could not decode returned data."))
                        }
                    }
                } else {
                    await MainActor.run {
                        authenticationState = .error(.ourFault(title: "That’s unexpected.",
                                                               description: "Something has gone horribly wrong.\nPlease contact us."))
                    }
                }
            } catch {
                await MainActor.run {
                    authenticationState = .error(.init(icon: "pc", title: "Something broke.", description: (error as NSError).localizedFailureReason ?? error.localizedDescription))
                }
            }
        }
    }
    
    func forgetPassword(email: String) {
        
    }
    
    func signOut() {
        do {
            user = nil
            try auth.signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func signIn() {
        user = .sample
    }
}
