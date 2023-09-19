//
//  AuthenticationEmailView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 19/9/23.
//

import SwiftUI

struct AuthenticationEmailView: View {
    
    @Binding var authenticationState: AuthenticationState
    
    @FocusState var isFocused
    
    @State private var email = ""
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "envelope.fill")
                .foregroundStyle(.blue)
                .frame(height: 96)
                .font(.system(size: 64))
            Text("What’s your email?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            HStack {
                TextField("Email Address", text: $email)
                    .focused($isFocused)
                    .submitLabel(.done)
                    .onSubmit {
                        withAnimation {
                            authenticationState = .lookingUpEmail(email)
                        }
                    }
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .disabled(authenticationState.isLookingUpEmail)
                
                if authenticationState.isLookingUpEmail {
                    ProgressView()
                }
            }
            .padding(16)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            Text("Use the email address you registered with SST Alumni Association.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
            Spacer()
            
            Button("Not registered with SST Alumni Association?") {
                
            }
        }
        .padding()
        .onAppear {
            isFocused = true
        }
    }
}
