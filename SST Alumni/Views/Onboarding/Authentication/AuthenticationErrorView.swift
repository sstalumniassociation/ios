//
//  AuthenticationErrorView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 20/9/23.
//

import SwiftUI

struct AuthenticationErrorView: View {
    
    var message: AuthErrorDescription
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            ErrorFlameView()
                .accessibilityHidden(true)
            
            VStack {
                Image(systemName: message.icon)
                    .foregroundStyle(.red)
                    .frame(height: 96)
                    .font(.system(size: 64))
                    .padding(.top)
                    .accessibilityHidden(true)
                
                Text(message.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Text(try! AttributedString(markdown: message.description))
                    .font(.body)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Text("OK")
                        .padding(8)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}
