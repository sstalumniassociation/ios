//
//  DeleteAccountView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 22/9/23.
//

import SwiftUI

struct DeleteAccountView: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Image(systemName: "trash")
                        .frame(height: 96)
                        .font(.system(size: 64))
                        .foregroundStyle(.red)
                        .padding(.top)
                    
                    Text("Delete Account")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    VStack(alignment: .leading, spacing: 21) {
                        Label("Your account with the SST Alumni Association App will be deleted.", systemImage: "1.circle")
                        Label("Any data associated with your SST Alumni Association membership will still be retained.", systemImage: "2.circle")
                        Label("To cancel your membership with the SST Alumni Association, contact us at [alumni@sstaa.org](alumni@sstaa.org).", systemImage: "3.circle")
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                    
                }
                .padding()
            }
            Button(role: .destructive) {
                
            } label: {
                Text("Delete My Account")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}

#Preview {
    DeleteAccountView()
}
