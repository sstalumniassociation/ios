//
//  EmailVerificationState.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 25/9/23.
//

import Foundation

enum EmailVerificationState: Equatable {
    case needsVerification
    case sendingEmail
    case sent
    case checkStatus
    case verified
    
    case error(AuthErrorDescription)
    
    var title: String {
        switch self {
        case .needsVerification:
            "Verify Your Email"
        case .sendingEmail:
            "Sending…"
        case .sent:
            "Check Your Email"
        case .checkStatus:
            "Checking…"
        case .verified:
            "Verified"
        case .error(let description):
            description.title
        }
    }
    
    var subtitle: String {
        switch self {
        case .needsVerification:
            "Email verification required to use app."
        case .sendingEmail:
            "Sending email."
        case .sent:
            "If you can't find it, check your Spam/Junk folder."
        case .checkStatus:
            "If you can't find it, check your Spam/Junk folder."
        case .verified:
            ""
        case .error(let error):
            error.description
        }
    }
}
