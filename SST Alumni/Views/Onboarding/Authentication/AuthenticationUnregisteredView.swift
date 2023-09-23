//
//  AuthenticationUnregisteredView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 21/9/23.
//

import SwiftUI

struct AuthenticationUnregisteredView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Image(systemName: "mail.and.text.magnifyingglass")
                .foregroundStyle(.blue)
                .frame(height: 96)
                .font(.system(size: 64))
                .padding(.top)
            
            Text("Unregistered Email")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("The email is not registered with the SST Alumni Association. Contact us at [app@sstaa.org](app@sstaa.org) to update your email, or sign up as a member with the SST Alumni Association.")
                .font(.body)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            #warning("Placeholder URL")
            Link(destination: URL(string: "https://sst.edu.sg")!) {
                Text("Sign up for SSTAA")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                dismiss()
            } label: {
                Text("OK")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}
