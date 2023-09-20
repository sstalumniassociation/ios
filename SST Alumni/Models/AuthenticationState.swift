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
///         \|/                         /|\  /|\      /|\ |         |      /|\
/// +--------------------------------+   |    |        |  |        \|/      |
/// | .registerPassword(Email, CFID) |   |    |        |  |  +---------------------------+
/// +--------------------------------+   |    |        |  |  | .incorrectPassword(Email) |
///                 |                    |    +--+  +--+  |  +---------------------------+
///                \|/                   |       |  |     |                |
/// +-----------------------------------------+  |  |    \|/              \|/
/// | .registeringUser(Email, Password, CFID) |  |  |  +------------------------+
/// +-----------------------------------------+  |  |  | .forgotPassword(Email) |
///                       |                      |  |  +------------------------+
///                      \|/                     |  |
///           +---------------------+            |  |
///           | .verifyEmailAddress |------------+  |
///           +---------------------+               |
///                       |                         |
///                      \|/                        |
///              +----------------+                 |
///              | .authenticated |<----------------+
///              +----------------+
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
    
    case verifyEmailAddress
    
    // Parameter: Email, Password
    case loggingIn(String, String)
    
    // Parameter: Email
    case incorrectPassword(String)
    
    // Parameter: Email
    case forgotPassword(String)
    
    case unregistered
    
    case error(AuthErrorHandle)
    
    case authenticated
    
    var isLookingUpEmail: Bool {
        switch self {
        case .lookingUpEmail: true
        default: false
        }
    }
}
