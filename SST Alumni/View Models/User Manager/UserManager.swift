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
    @Published var user: UserData? {
        didSet {
            writeData()
        }
    }
    @Published var firebaseUser: User?
    
    @Published var emailVerificationState = EmailVerificationState.needsVerification
    
    @Published var authenticationState = AuthenticationState.emailInput {
        didSet {
            Task {
                switch authenticationState {
                case .lookingUpEmail(let email):
                    await lookUpEmail(email)
                case .registeringUser(let email, let password, let cloudflareUserId):
                    await registerUser(email: email, password: password, cloudflareId: cloudflareUserId)
                case .loggingIn(let email, let password):
                    await logIn(email: email, password: password)
                default: break
                }
            }
        }
    }
    
    let auth: Auth
    
    init() {
        self.auth = Auth.auth()
        
        firebaseUser = auth.currentUser
        emailVerificationState = (auth.currentUser?.isEmailVerified ?? false) ? .verified : .needsVerification
        authenticationState = .authenticated
        
        loadUserData()
        
        if emailVerificationState == .needsVerification {
            Task {
                try await firebaseUser?.reload()
                emailVerificationState = (auth.currentUser?.isEmailVerified ?? false) ? .verified : .needsVerification
            }
        }
        
        auth.addStateDidChangeListener { [self] auth, user in
            Task {
                await MainActor.run {
                    emailVerificationState = (auth.currentUser?.isEmailVerified ?? false) ? .verified : .needsVerification
                    
                    if user != nil && self.authenticationState == .authenticated {
                        self.firebaseUser = user
                    } else {
                        self.firebaseUser = nil
                    }
                }
                
                await fetchUserData()
            }
        }
    }
    
    func sendEmailVerification() {
        withAnimation {
            emailVerificationState = .sendingEmail
        }
        
        Task {
            let verificationState: EmailVerificationState
            do {
                if let currentUser = auth.currentUser {
                    try await currentUser.sendEmailVerification()
                    
                    verificationState = .sent
                } else {
                    verificationState = .error(.userNotFound)
                }
            } catch {
                verificationState = .error(.from(.firebaseError(error)))
            }
            
            await MainActor.run {
                withAnimation {
                    emailVerificationState = verificationState
                }
            }
        }
    }
    
    func checkEmailVerification() {
        withAnimation {
            emailVerificationState = .checkStatus
        }
        
        Task {
            let verificationState: EmailVerificationState
            
            do {
                if let currentUser = auth.currentUser {
                    try await currentUser.reload()
                    
                    if currentUser.isEmailVerified {
                        verificationState = .verified
                    } else {
                        verificationState = .sent
                    }
                } else {
                    verificationState = .error(.userNotFound)
                }
            } catch {
                verificationState = .error(.from(.firebaseError(error)))
            }
            
            await MainActor.run {
                withAnimation {
                    emailVerificationState = verificationState
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
    
    func fetchUserData() async {
        guard let uid = firebaseUser?.uid else { return }
        
        switch await getUserData(with: uid) {
        case .success(let userData):
            await MainActor.run {
                self.user = userData
            }
            
        case .failure(let error):
            print(error)
            // TODO: Handle error with option to sign out or retry
        }
    }
    
    // TODO: Display waiting view, reauthenticate user
    func deleteAndUnlinkAccount() {
        guard let firebaseUser, let user else { return }
        Task {
            do {
                switch await sendRequest(to: "user/\(user.id)", method: "DELETE") {
                case .success(let (data, response)):
                    try await firebaseUser.delete()
                case .failure(let error):
                    print(error)
                }
                
            } catch {
                print(error.localizedDescription)
                print(error)
            }
        }
    }
}

enum EmailVerificationState: Equatable {
    case needsVerification
    case sendingEmail
    case sent
    case checkStatus
    case verified
    
    case error(AuthErrorDescription)
    
    var title: String {
        switch self {
        case .needsVerification:
            "Verify Your Email"
        case .sendingEmail:
            "Sending…"
        case .sent:
            "Check Your Email"
        case .checkStatus:
            "Checking…"
        case .verified:
            "Verified"
        case .error(let description):
            description.title
        }
    }
    
    var subtitle: String {
        switch self {
        case .needsVerification:
            "Email verification required to use app."
        case .sendingEmail:
            "Sending email."
        case .sent:
            "If you can't find it, check your Spam/Junk folder."
        case .checkStatus:
            "If you can't find it, check your Spam/Junk folder."
        case .verified:
            ""
        case .error(let error):
            error.description
        }
    }
}
