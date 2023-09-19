//
//  SignUpView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 19/9/23.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        NavigationStack {
            Group {
                switch userManager.signUpState {
                case .creatingAccount:
                    SignUpCreateAccountView()
                case .processing:
                    VStack {
                        ProgressView()
                            .padding()
                        Text("Creating Account…")
                            .font(.headline)
                        Text("This may take a bit")
                            .foregroundStyle(.secondary)
                    }
                case .additionalVerificationRequired:
                    Form {
                        Text("Google Sign In")
                    }
                case .verifyEmail:
                    Form {
                        Text("Verify your email")
                    }
                }
            }
            .navigationTitle(userManager.signUpState.navigationTitle)
        }
        .interactiveDismissDisabled(userManager.signUpState != .creatingAccount)
    }
}
