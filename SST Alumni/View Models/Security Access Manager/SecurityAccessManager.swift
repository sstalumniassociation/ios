//
//  SecurityAccessManager.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation

class SecurityAccessManager: ObservableObject {
    @Published var securityAccessState = SecurityAccessState.processing
    
    func performCheck() {
        Task {
            let locationValidationResult = await LocationValidationManager().checkLocation()
            
            guard locationValidationResult == .approved else {
                securityAccessState = .denied(.location(locationValidationResult))
                return
            }
            
            let biometricsAuthenticationResult = await performBiometricsAuthentication()
            
            guard biometricsAuthenticationResult == .approved else {
                securityAccessState = .denied(.biometrics(biometricsAuthenticationResult))
                return
            }
        }
    }
}
