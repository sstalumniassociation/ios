//
//  AuthenticationEmailVerificationRequired.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 22/9/23.
//

import SwiftUI

struct AuthenticationEmailVerificationRequired: View {
    
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            if userManager.emailVerificationState == .sent {
                Image(systemName: "envelope.open")
                    .frame(height: 96)
                    .font(.system(size: 64))
                    .padding(.top)
                    .accessibilityHidden(true)
                    .transition(.scale.combined(with: .opacity))
            } else {
                Image(systemName: "envelope")
                    .frame(height: 96)
                    .font(.system(size: 64))
                    .padding(.top)
                    .accessibilityHidden(true)
                    .transition(.scale.combined(with: .opacity))
            }
            
            Text(userManager.emailVerificationState.title)
                .font(.title)
                .fontWeight(.bold)
                .padding([.horizontal, .top])
            
            Text(userManager.emailVerificationState.subtitle)
                .multilineTextAlignment(.center)
                .padding([.bottom, .horizontal])
            
            switch userManager.emailVerificationState {
            case .needsVerification:
                Button {
                    withAnimation(.easeInOut) {
                        userManager.sendEmailVerification()
                    }
                } label: {
                    Text("Send Email")
                        .padding(8)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            case .sendingEmail, .checkStatus:
                ProgressView()
            case .sent:
                Button {
                    withAnimation(.easeInOut) {
                        userManager.checkEmailVerification()
                    }
                } label: {
                    Text("Check Verification")
                        .padding(8)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            case .error, .verified: EmptyView()
            }
            
            Spacer()
        }
        .padding()
    }
}
