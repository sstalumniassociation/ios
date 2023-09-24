//
//  AuthenticationForgetPasswordView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 24/9/23.
//

import SwiftUI

struct AuthenticationForgetPasswordView: View {
    
    @Binding var authenticationState: AuthenticationState
    
    var email: String
    
    var body: some View {
        VStack {
            Image(systemName: "envelope.fill")
                .foregroundStyle(.blue)
                .frame(height: 96)
                .font(.system(size: 64))
                .padding(.top)
            Text("Check your Email!")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .multilineTextAlignment(.center)
            
            Text("An email to reset your password has been sent!")
                .padding()
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button {
                withAnimation {
                    authenticationState = .logInPassword(email)
                }
            } label: {
                Text("Back to Log In")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(!isValid(email: email))
        }
        .padding()
    }
}
