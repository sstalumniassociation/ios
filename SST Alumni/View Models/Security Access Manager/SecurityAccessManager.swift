//
//  SecurityAccessManager.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation

class SecurityAccessManager: ObservableObject {
    
    static let isEnabled = false
    
    @Published var authorizationRequestDate = Date.now
    @Published var isTimedOut = false
    
    var authorizationRequestDateString: String {
        authorizationRequestDate.formatted(date: .abbreviated, time: .omitted)
    }
    
    var authorizationRequestTimeString: String {
        authorizationRequestDate.formatted(date: .omitted, time: .shortened)
    }
    
    @Published var securityAccessState = SecurityAccessState.processing
    
    private let locationValidationManager = LocationValidationManager()
    
    func performCheck() {
        authorizationRequestDate = Date.now
        Task {
            let biometricsAuthenticationResult = await performBiometricsAuthentication()
            
            guard biometricsAuthenticationResult == .approved else {
                await MainActor.run {
                    securityAccessState = .denied(.biometrics(biometricsAuthenticationResult))
                }
                return
            }
            
            await MainActor.run {
                securityAccessState = .admitted
            }
            
            try await Task.sleep(for: .seconds(30))
            
            await MainActor.run {
                isTimedOut = true
            }
        }
    }
}
