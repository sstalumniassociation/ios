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
    @Published var firebaseUser: User?
    
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
        
        var firstLoad = true
        
        firebaseUser = auth.currentUser
        
        auth.addStateDidChangeListener { auth, user in
            guard !firstLoad else {
                firstLoad = false
                return
            }
            Task {
                await MainActor.run {
                    if user != nil && self.authenticationState == .authenticated {
                        self.firebaseUser = user
                    } else {
                        self.firebaseUser = nil
                    }
                }
            }
        }
    }
    
    func sendEmailVerification() {
        #warning("Incomplete implementation")
//        let actionCode = ActionCodeSettings.init()
        
//        auth.currentUser?.sendEmailVerification(with: ActionCodeSettings.init(), completion: <#T##((Error?) -> Void)?##((Error?) -> Void)?##(Error?) -> Void#>)
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
