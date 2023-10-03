//
//  DeleteAccountView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 22/9/23.
//

import SwiftUI

struct DeleteAccountView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack {
            Image(systemName: "trash")
                .frame(height: 96)
                .font(.system(size: 64))
                .foregroundStyle(.red)
                .padding(.top)
                .accessibilityHidden(true)
            
            Text("Delete Account")
                .multilineTextAlignment(.center)
                .font(.title)
                .fontWeight(.bold)
            
            Text("In order to delete your account and cancel your membership with SST Alumni Association, you will need to contact us at [alumni@sstaa.org](alumni@sstaa.org).")
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button {
                openURL(URL(string: "mailto:alumni@sstaa.org")!)
            } label: {
                Text("Email Us")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                dismiss()
            } label: {
                Text("Cancel")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

#Preview {
    DeleteAccountView()
}
