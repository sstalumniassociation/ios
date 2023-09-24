//
//  AuthenticationLogInPasswordView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 20/9/23.
//

import SwiftUI

struct AuthenticationLogInPasswordView: View {
    
    var isIncorrectPassword: Bool
    
    var email: String
    
    @Binding var authenticationState: AuthenticationState
    
    @FocusState var isFocused
    @State private var password = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "ellipsis.rectangle")
                    .foregroundStyle(isIncorrectPassword ? .red : .blue)
                    .frame(height: 96)
                    .font(.system(size: 64))
                    .padding(.top)
                    .accessibilityHidden(true)
                
                Text(isIncorrectPassword ? "That’s not it…" : "What’s your password?")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding([.horizontal, .top])
                    .padding(.bottom, isIncorrectPassword ? 0 : 21)
                
                if isIncorrectPassword {
                    Text("Incorrect Password")
                        .padding([.bottom, .horizontal])
                }
                
                HStack {
                    SecureField("Password", text: $password)
                        .focused($isFocused)
                        .textContentType(.password)
                        .textInputAutocapitalization(.never)
                }
                .padding(16)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Button {
                    withAnimation {
                        authenticationState = .loggingIn(email, password)
                    }
                } label: {
                    Text("Next")
                        .padding(8)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .disabled(!isValid(email: email))
                
                Button("Forgot Password?") {
                    authenticationState = .forgotPasswordSending(email)
                }
                Spacer()
            }
        }
        .padding()
        .onAppear {
            isFocused = true
        }
    }
}
