//
//  UserManager+DeleteAccount.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 25/9/23.
//

import Foundation
import FirebaseAuth

extension UserManager {
    func deleteAndUnlinkAccount(password: String) async -> AuthErrorDescription? {
        guard let firebaseUser, let email = firebaseUser.email, let user else {
            return .userNotFound
        }
        
        switch await firebaseSignIn(withEmail: email, password: password) {
        case .success:
            return await deleteAccount(firebaseUser, user: user)
        case .failure(let error):
            return .from(error)
        }
    }
    
    fileprivate func deleteAccount(_ firebaseUser: User, user: UserData) async -> AuthErrorDescription? {
        switch await firebaseDeleteAccount(firebaseUser) {
        case .success:
            switch await sendRequest(to: "user/\(user.id)", method: "DELETE") {
            case .success:
                return nil
            case .failure(let error):
                return .from(error)
            }
        case .failure(let error):
            return .from(error)
        }
    }
    
    fileprivate func firebaseDeleteAccount(_ firebaseUser: User) async -> Result<String, OnboardingHTTPError> {
        do {
            try await firebaseUser.delete()
            return .success("")
        } catch {
            print(error)
            return .failure(.firebaseError(error))
        }
    }
}
