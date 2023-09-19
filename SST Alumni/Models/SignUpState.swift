//
//  SignUpState.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 19/9/23.
//

import Foundation

enum SignUpState {
    case creatingAccount
    case processing
    case additionalVerificationRequired
    case verifyEmail
    
    var navigationTitle: String {
        switch self {
        case .creatingAccount:
            return "Sign Up"
        case .processing:
            return ""
        case .additionalVerificationRequired:
            return "Verification Required"
        case .verifyEmail:
            return "Check Your Email"
        }
    }
}
