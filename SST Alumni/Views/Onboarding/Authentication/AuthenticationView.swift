//
//  AuthenticationView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 20/9/23.
//

import SwiftUI

struct AuthenticationView: View {
    
    @Environment(UserManager.self) var userManager
    
    var body: some View {
        @Bindable var userManager = userManager
        
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
            case .forgotPasswordSent(let email):
                AuthenticationForgetPasswordSentView(authenticationState: $userManager.authenticationState,
                                                 email: email)
            case .forgotPasswordSending:
                AuthenticationLoadingView(systemName: "paperplane", title: "Sending Password Reset Email…")
            case .unregistered:
                AuthenticationUnregisteredView()
            case .error(let message):
                AuthenticationErrorView(message: message)
            case .loggingIn:
                AuthenticationLoadingView(systemName: "person.crop.circle", title: "Logging In…")
            case .authenticated:
                VStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.blue)
                        .frame(height: 96)
                        .font(.system(size: 64))
                        .padding(.top)
                    
                    Text("Authenticated")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    Spacer()
                }
                .padding()
            }
        }
        .animation(.default, value: userManager.authenticationState)
        .onAppear {
            userManager.authenticationState = .emailInput
        }
    }
}

#Preview {
    AuthenticationView()
}
