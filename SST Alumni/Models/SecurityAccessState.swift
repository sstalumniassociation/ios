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
        case biometrics(BiometricAuthenticationState)
        case location(LocationValidationState)
    }
}
