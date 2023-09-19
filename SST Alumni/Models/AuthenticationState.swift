//
//  AuthenticationState.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 20/9/23.
//

import Foundation

enum AuthenticationState {
    case emailInput
    
    case lookingUpEmail(String)
    
    case logInPassword
    
    // Parameter: Cloudflare ID
    case registerPassword(String)
    case verifyEmailAddress
    
    case forgotPassword
    
    case unregistered
    
    case error(WhoseFault, String)
    
    enum WhoseFault {
        case ours
        case theirs
    }
    
    var isLookingUpEmail: Bool {
        switch self {
        case .lookingUpEmail: true
        default: false
        }
    }
}
