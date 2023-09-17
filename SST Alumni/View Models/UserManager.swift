//
//  UserManager.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation
import FirebaseAuth

class UserManager: ObservableObject {
    @Published var user: UserData?
    var firebaseUser: User?
    
    let auth: Auth
    
    init() {
        self.auth = Auth.auth()
        
        auth.addStateDidChangeListener { auth, user in
            if user == nil {
                
            }
        }
    }
    
    func signOut() {
        do {
            try auth.signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func signIn() {
        user = .sample
    }
}
