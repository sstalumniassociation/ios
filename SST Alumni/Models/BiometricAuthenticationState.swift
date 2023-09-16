//
//  BiometricAuthenticationState.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import Foundation

enum BiometricAuthenticationState {
    case noData
    case noBiometrics
    case biometricsFailure
    case approved
    
    var description: String {
        switch self {
        case .noData: return "No Data"
        case .noBiometrics: return "A password must be set on your device."
        case .biometricsFailure: return "Failed to authenticate."
        case .approved: return "Approved"
        }
    }
}
