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
            case .logInPassword(let email):
                AuthenticationLogInPasswordView(isIncorrectPassword: false,
                                                email: email,
                                                authenticationState: $userManager.authenticationState)
            case .registerPassword(let email, let cloudflareId):
                AuthenticationRegisterPasswordView(email: email,
                                                   cloudflareId: cloudflareId,
                                                   authenticationState: $userManager.authenticationState)
            case .incorrectPassword(let email):
                AuthenticationLogInPasswordView(isIncorrectPassword: true,
                                                email: email,
                                                authenticationState: $userManager.authenticationState)
            case .registeringUser:
                AuthenticationLoadingView(systemName: "person.fill.checkmark", title: "Registering…")
            case .forgotPassword:
                EmptyView()
            case .unregistered:
                AuthenticationUnregisteredView()
            case .error(let message):
                AuthenticationErrorView(message: message)
            case .loggingIn:
                AuthenticationLoadingView(systemName: "person.crop.circle", title: "Logging In…")
            case .authenticated:
                EmptyView()
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
