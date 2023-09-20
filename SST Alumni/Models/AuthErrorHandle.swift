//
//  AuthErrorHandle.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 20/9/23.
//

import Foundation


class AuthErrorHandle: Equatable {
    static func == (lhs: AuthErrorHandle, rhs: AuthErrorHandle) -> Bool {
        lhs.title == rhs.title && lhs.description == rhs.description
    }
    
    var icon: String
    
    var title: String
    var description: String
    
    var recoverToState: AuthenticationState?
    
    required
    init(icon: String, title: String, description: String, recoverToState: AuthenticationState? = nil) {
        self.icon = icon
        self.title = title
        self.description = description
        self.recoverToState = recoverToState
    }
    
    static func ourFault(icon: String = "pc",
                         title: String = "Something went wrong.",
                         description: String = "This is on us.",
                         recoverToState: AuthenticationState? = nil) -> Self {
        Self.init(icon: icon, title: title, description: description, recoverToState: recoverToState)
    }
}
