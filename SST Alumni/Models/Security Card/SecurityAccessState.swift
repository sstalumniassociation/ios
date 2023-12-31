//
//  SecurityAccessState.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation

enum SecurityAccessState: Equatable {
    case processing
    case denied(DeniedReason)
    case admitted
    
    enum DeniedReason: Equatable {
        case biometrics(BiometricAuthenticationState)
        case location(LocationValidationState)
        
        var description: String {
            switch self {
            case .biometrics(let state): return state.description
            case .location(let state): return state.description
            }
        }
    }
}
