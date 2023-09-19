//
//  UserManager.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation
import FirebaseAuth
import Alamofire

class UserManager: ObservableObject {
    @Published var user: UserData?
    var firebaseUser: User?
    
    @Published var authenticationState = AuthenticationState.emailInput {
        didSet {
            print(authenticationState)
            switch authenticationState {
            case .lookingUpEmail(let email):
                validateEmail(email)
            default: break
            }
        }
    }
    
    let auth: Auth
    
    init() {
        self.auth = Auth.auth()
        
        auth.addStateDidChangeListener { auth, user in
            if user == nil {
                
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
                authState = .error(.ours, "Internal Server Error")
            case 200...299:
                if let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let cloudflareUserId = jsonData["id"] as? String,
                   let isLinked = jsonData["linked"] as? Bool {
                    if isLinked {
                        authState = .logInPassword
                    } else {
                        authState = .registerPassword(cloudflareUserId)
                    }
                } else {
                    authState = .error(.ours, "Unable to decode data.")
                }
            default: authState = .error(.ours, "Something has gone horribly wrong.\nPlease contact us.")
            }
            
            await MainActor.run {
                authenticationState = authState
            }
        }
    }
    
    func beginSignUp(email: String, password: String) async {
//        await MainActor.run {
//            signUpState = .processing
//        }
//        
//        do {
//            if let discoveredUser = try await checkIfDatabaseContainsEmail(email) {
//                try await createUserAndVerifyEmail(email: email, password: password)
//            } else {
//                switch extractInformation(fromSSTEmail: email) {
//                case .staff(let staffName):
//                    try await createUserAndVerifyEmail(email: email, password: password)
//                    // Create a new user in the database
//                case .student(let studentName):
//                    try await createUserAndVerifyEmail(email: email, password: password)
//                    // Create a new user in the database
//                case .invalid:
//                    await MainActor.run {
//                        signUpState = .additionalVerificationRequired
//                    }
//                    // Require additional verification
//                }
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
    }
    
    func createUserAndVerifyEmail(email: String, password: String) async throws {
        try await auth.createUser(withEmail: email, password: password)
        
    }
    
    func checkIfDatabaseContainsEmail(_ email: String) async throws -> UserData? {
        // Send a POST request
        var request = URLRequest(url: .cfServer.appendingPathComponent("verifyuser"))
        request.httpMethod = "POST"
        
        let dict = ["email": email]
        let dataToSend = try JSONSerialization.data(withJSONObject: dict, options: [])
        
        request.httpBody = dataToSend
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse else { return nil }
        
        if 400...499 ~= response.statusCode {
            return nil
        } else {
            let decoder = JSONDecoder()
            return try? decoder.decode(UserData.self, from: data)
        }
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
