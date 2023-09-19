//
//  AuthenticationView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 20/9/23.
//

import SwiftUI

struct AuthenticationView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            switch userManager.authenticationState {
            case .emailInput, .lookingUpEmail:
                AuthenticationEmailView(authenticationState: $userManager.authenticationState)
            case .logInEmail:
                Text("Login")
            case .registerEmail:
                Text("Register")
            case .verifyEmailAddress:
                EmptyView()
            case .forgotPassword:
                EmptyView()
            case .unregistered:
                EmptyView()
            case .error(let whoseFault, let message):
                Text("Error \(message)")
            }
        }
        .onAppear {
            userManager.authenticationState = .emailInput
        }
    }
}

#Preview {
    AuthenticationView()
}
