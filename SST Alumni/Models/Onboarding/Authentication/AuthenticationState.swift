//
//  AuthenticationState.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 20/9/23.
//

import Foundation

/// Authentication State
///
/// ```
///           +-------------+
///           | .emailInput |
///           +-------------+
///                  |
///                 \|/
///      +------------------------+                 +---------------+
///      | .lookingUpEmail(Email) |---------------->| .unregistered |
///      +------------------------+                 +---------------+
///          |       |       |
///          |       |       |                      +-----------------------+
///          |       |       +--------------------->| .logInPassword(Email) |
///          |       |                              +-----------------------+
///          |       |                                      |
///          |       |                                     \|/
///          |       |      +-------------------+   +-----------------------------+
///          |       +----->| .error(AuthError) |<--| .loggingIn(Email, Password) |
///          |              +-------------------+   +-----------------------------+
///         \|/                         /|\            |  /|\  |      |      /|\
/// +--------------------------------+   |             |   |   |     \|/      |
/// | .registerPassword(Email, CFID) |   |             |   |   |   +---------------------------+
/// +--------------------------------+   |             |   |   |   | .incorrectPassword(Email) |
///                 |                    |             |   |   |   +---------------------------+
///                \|/                   |             |   |   |              |
/// +-----------------------------------------+        |   |  \|/            \|/
/// | .registeringUser(Email, Password, CFID) |        |   |  +-------------------------------+
/// +-----------------------------------------+        |   |  | .forgotPasswordSending(Email) |
///                       |                            |   |  +-------------------------------+
///                      \|/                           |   |                  |
///              +----------------+                    |   |                 \|/
///              | .authenticated |<-------------------+   |   +-----------------------------+
///              +----------------+                        +---| .forgotPasswordSent(String) |
///                                                            +-----------------------------+
///
/// ```
enum AuthenticationState: Equatable {
    case emailInput
    
    case lookingUpEmail(String)
    
    case logInPassword(String)
    
    // Parameter: Email, Cloudflare ID
    case registerPassword(String, String)
    
    // Parameter: Email, Password, CloudFlare User ID
    case registeringUser(String, String, String)
    
    // Parameter: Email, Password
    case loggingIn(String, String)
    
    // Parameter: Email
    case incorrectPassword(String)
    
    // Parameter: Email
    case forgotPasswordSending(String)
    case forgotPasswordSent(String)
    
    case unregistered
    
    case error(AuthErrorDescription)
    
    case authenticated
    
    var isLookingUpEmail: Bool {
        switch self {
        case .lookingUpEmail: true
        default: false
        }
    }
}
