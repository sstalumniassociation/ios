//
//  UserManager+LookUpUser.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 21/9/23.
//

import Foundation

extension UserManager {
    func lookUpEmail(_ email: String) async {
        
        let result = await sendRequest(to: "auth/verify/",
                                       withToken: false,
                                       dict: ["email": email])
        
        let authState = handleEmailLookupResult(result: result, email: email)
        
        await MainActor.run {
            authenticationState = authState
        }
    }
    
    fileprivate func handleEmailLookupResult(result: Result<(Data, HTTPURLResponse), OnboardingHTTPError>,
                                             email: String) -> AuthenticationState {
        switch result {
        case .success(let (data, response)):
            switch response.statusCode {
            case 400...499:
                return .unregistered
            case 500...599:
                return .error(.internalServerError)
            case 200...299:
                return extractAuthenticationState(from: data, email)
            default:
                return .error(.somethingWentHorriblyWrong)
            }
        case .failure(let error):
            return .error(.from(error))
        }
    }
    
    fileprivate func extractAuthenticationState(from data: Data, 
                                                _ email: String) -> AuthenticationState {
        guard let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
              let cloudflareUserId = jsonData["id"] as? String,
              let isLinked = jsonData["linked"] as? Bool else {
            return .error(.couldNotDecodeData)
        }
        
        return isLinked ? .logInPassword(email) : .registerPassword(email, cloudflareUserId)
    }
}
