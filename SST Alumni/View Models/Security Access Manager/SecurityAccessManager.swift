//
//  SecurityAccessManager.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation
import Observation

@MainActor
@Observable
class SecurityAccessManager: ObservableObject {
    
    static let isEnabled = false
    
    var authorizationRequestDate = Date.now
    var isTimedOut = false
    
    var authorizationRequestDateString: String {
        authorizationRequestDate.formatted(date: .abbreviated, time: .omitted)
    }
    
    var authorizationRequestTimeString: String {
        authorizationRequestDate.formatted(date: .omitted, time: .shortened)
    }
    
    var securityAccessState = SecurityAccessState.processing
    
    private let locationValidationManager = LocationValidationManager()
    
    func performCheck() async {
        authorizationRequestDate = Date.now
        
        let biometricsAuthenticationResult = await performBiometricsAuthentication()
        
        guard biometricsAuthenticationResult == .approved else {
            securityAccessState = .denied(.biometrics(biometricsAuthenticationResult))
            return
        }
        
        securityAccessState = .admitted
        
        try? await Task.sleep(for: .seconds(30))
        
        isTimedOut = true
    }
}
