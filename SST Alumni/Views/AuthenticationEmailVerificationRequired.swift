//
//  AuthenticationEmailVerificationRequired.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 22/9/23.
//

import SwiftUI

struct AuthenticationEmailVerificationRequired: View {
    
    @EnvironmentObject var userManager: UserManager
    
    @State private var isEmailSent = false
    
    var body: some View {
        VStack {
            if isEmailSent {
                Image(systemName: "envelope.open")
                    .frame(height: 96)
                    .font(.system(size: 64))
                    .padding(.top)
                    .transition(.scale.combined(with: .opacity))
            } else {
                Image(systemName: "envelope")
                    .frame(height: 96)
                    .font(.system(size: 64))
                    .padding(.top)
                    .transition(.scale.combined(with: .opacity))
            }
            
            Text(isEmailSent ? "Check Your Inbox" : "Verify Your Email")
                .font(.title)
                .fontWeight(.bold)
                .padding([.horizontal, .top])
            
            Text(isEmailSent ? "If you can't find it, check your Spam/Junk folder." : "Email verification required to use app.")
                .multilineTextAlignment(.center)
                .padding([.bottom, .horizontal])
            
            Button {
                withAnimation(.easeInOut) {
                    isEmailSent.toggle()
                }
            } label: {
                Text("Send Email")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
    }
}
