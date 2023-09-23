//
//  UserManager+RegisterUser.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 21/9/23.
//

import Foundation
import FirebaseAuth

extension UserManager {
    func registerUser(email: String, password: String, cloudflareId: String) async {
        switch await registerUserToDatabases(email: email,
                                             password: password,
                                             cloudflareId: cloudflareId) {
        case .success(let user):
            await MainActor.run {
                self.user = user
                authenticationState = .authenticated
            }
        case .failure(let error):
            await MainActor.run {
                authenticationState = .error(.from(error))
            }
        }
    }
    
    fileprivate func registerUserToDatabases(email: String,
                                             password: String,
                                             cloudflareId: String) async -> Result<UserData, OnboardingHTTPError> {
        switch await createUser(withEmail: email, password: password) {
        case .success(let authDataResult):
            
            switch await writeNewUserToCloudflare(with: authDataResult.user.uid,
                                                  cloudflareId: cloudflareId) {
            case .success(let user):
                return .success(user)
            case .failure(let error):
                return .failure(error)
            }
            
        case .failure(let error):
            return .failure(error)
        }
    }
    
    fileprivate func writeNewUserToCloudflare(with firebaseUserId: String,
                                              cloudflareId cfid: String) async -> Result<UserData, OnboardingHTTPError> {
        switch await sendRequest(to: "user/\(cfid)/",
                                 dict: ["firebaseId": firebaseUserId]) {
        case .success(let (data, response)):
            guard 200...299 ~= response.statusCode else {
                return .failure(500...599 ~= response.statusCode ? .internalServerError : .unexpectedStatusCode)
            }
            
            do {
                let decoder = JSONDecoder()
                
                return .success(try decoder.decode(UserData.self, from: data))
            } catch {
                print(error.localizedDescription)
                return .failure(.decodingError(error))
            }
        case .failure(let error):
            return .failure(error)
        }
    }
    
    fileprivate func createUser(withEmail email: String,
                                password: String) async -> Result<AuthDataResult, OnboardingHTTPError> {
        do {
            return .success(try await auth.createUser(withEmail: email, password: password))
        } catch {
            return .failure(.firebaseError(error))
        }
    }
}
