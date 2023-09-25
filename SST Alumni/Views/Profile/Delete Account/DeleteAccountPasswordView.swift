//
//  DeleteAccountPasswordView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 25/9/23.
//

import SwiftUI

struct DeleteAccountPasswordView: View {
    
    @Binding var deleteAccountState: DeleteAccountState
    
    @Environment(\.dismiss) var dismiss
    
    @FocusState private var isFocused
    @State private var password = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Image(systemName: "ellipsis.rectangle")
                        .frame(height: 96)
                        .font(.system(size: 64))
                        .foregroundStyle(.red)
                        .padding(.top)
                        .accessibilityHidden(true)
                    
                    Text("Password Required")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Password is required to delete your account.")
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        SecureField("Password", text: $password)
                            .focused($isFocused)
                            .textContentType(.password)
                            .textInputAutocapitalization(.never)
                    }
                    .padding(16)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding()
            }
            
            Button(role: .cancel) {
                dismiss()
            } label: {
                Text("Cancel")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
            
            Button(role: .destructive) {
                withAnimation {
                    deleteAccountState = .deleting
                }
            } label: {
                Text("Delete My Account")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding([.horizontal, .bottom])
        }
        .onAppear {
            isFocused.toggle()
        }
    }
}
