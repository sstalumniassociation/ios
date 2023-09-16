//
//  SecurityAccessManager.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation

class SecurityAccessManager: ObservableObject {
    
    @Published var authorizationRequestDate = Date.now
    
    var authorizationRequestDateString: String {
        authorizationRequestDate.formatted(date: .abbreviated, time: .omitted)
    }
    
    var authorizationRequestTimeString: String {
        authorizationRequestDate.formatted(date: .omitted, time: .standard)
    }
    
    @Published var securityAccessState = SecurityAccessState.processing
    
    private let locationValidationManager = LocationValidationManager()
    
    func performCheck() {
        authorizationRequestDate = Date.now
        Task {
            let locationValidationResult = await locationValidationManager.checkLocation()
            
            guard locationValidationResult == .approved else {
                await MainActor.run {
                    securityAccessState = .denied(.location(locationValidationResult))
                }
                return
            }
            
            let biometricsAuthenticationResult = await performBiometricsAuthentication()
            
            guard biometricsAuthenticationResult == .approved else {
                await MainActor.run {
                    securityAccessState = .denied(.biometrics(biometricsAuthenticationResult))
                }
                return
            }
            
            securityAccessState = .admitted
        }
    }
}
