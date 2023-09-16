//
//  SecurityAccessState.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation

enum SecurityAccessState {
    case processing
    case denied(DeniedReason)
    case admitted
    
    enum DeniedReason {
        /// Device does not have biometrics enabled
        case noBiometrics
        
        /// Failed to authenticate with biometrics
        case biometricsFailure
        
        /// User is not in SST
        case location
    }
}

enum BiometricAuthenticationState {
    case noData
    case noBiometrics
    case biometricsFailure
    case approved
}
