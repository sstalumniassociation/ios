//
//  SecurityAccessManager.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation

class SecurityAccessManager: ObservableObject {
    @Published var securityAccessState = SecurityAccessState.processing
    
    var biometricAuthenticationState: BiometricAuthenticationState = .noData
    
    func performCheck() {
        Task {
            await performBiometricsAuthentication()
        }
    }
}
