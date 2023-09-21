//
//  UserManager+LogIn.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 21/9/23.
//

import Foundation
import SwiftUI
import FirebaseAuth

extension UserManager {
    func logIn(email: String, password: String) async {
        switch await signIn(withEmail: email, password: password) {
        case .success(let result):
            let user = result.user
            
            switch await getUserData(with: user.uid) {
            case .success(let userData):
                await MainActor.run {
                    withAnimation {
                        self.user = userData
                        authenticationState = .authenticated
                    }
                }
            case .failure(let error):
                await MainActor.run {
                    authenticationState = .error(.from(error))
                }
            }
        case .failure(let error):
            await MainActor.run {
                switch error {
                case .incorrectPassword:
                    authenticationState = .incorrectPassword(email)
                default:
                    authenticationState = .error(.from(error))
                }
            }
        }
    }
    
    fileprivate func getUserData(with userId: String) async -> Result<UserData, OnboardingHTTPError> {
        switch await sendRequest(to: "user/\(userId)") {
        case .success(let (data, _)):
            do {
                let decoder = JSONDecoder()
                return .success(try decoder.decode(UserData.self, from: data))
            } catch {
                return .failure(.decodingError(error))
            }
        case .failure(let error):
            return .failure(error)
        }
    }
    
    fileprivate func signIn(withEmail email: String,
                            password: String) async -> Result<AuthDataResult, OnboardingHTTPError> {
        do {
            return .success(try await auth.signIn(withEmail: email, password: password))
        } catch {
            let error = error as NSError
            
            guard let errorDescription = AuthErrorDescription.fromFirebase(error.code) else {
                return .failure(.somethingWentHorriblyWrong)
            }
            
            if errorDescription == .internalError || errorDescription == .wrongPassword {
                return .failure(.incorrectPassword)
            }
            
            return .failure(.firebaseError(error))
        }
    }
}
