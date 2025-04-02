//
//  UserManager+Requests.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 21/9/23.
//

import Foundation
@preconcurrency import FirebaseAuth

extension UserManager {
    func sendRequest(to endpoint: String,
                     withToken: Bool = true,
                     dict: [String: Any]) async -> Result<(Data, HTTPURLResponse), OnboardingHTTPError> {
        do {
            let dataToSend = try JSONSerialization.data(withJSONObject: dict, options: [.fragmentsAllowed])
            
            return await sendRequest(to: endpoint, withToken: withToken, method: "POST", httpBody: dataToSend)
        } catch {
            return .failure(.encodingError(error))
        }
    }
    
    func sendRequest(to endpoint: String,
                     withToken: Bool = true,
                     method: String = "GET",
                     httpBody: Data? = nil) async -> Result<(Data, HTTPURLResponse), OnboardingHTTPError> {
        var request = URLRequest(url: .cfServer.appendingPathComponent(endpoint))
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if withToken {
            guard let user = auth.currentUser else {
                return .failure(.noFirebaseUser)
            }
            
            do {
                let token = try await user.getIDToken()
                
                request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            } catch {
                return .failure(.couldNotGetToken)
            }
        }
        
        request.httpBody = httpBody
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse else {
                throw OnboardingHTTPError.unexpectedHTTPResponseFormat
            }
            
            return .success((data, response))
        } catch {
            return .failure(.httpError(error))
        }
    }
}
