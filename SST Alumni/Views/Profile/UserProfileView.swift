//
//  UserProfileView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 19/9/23.
//

import SwiftUI

struct UserProfileView: View {
    
    @Environment(UserManager.self) var userManager
    
    @State private var isDeleteAccountSheetPresented = false
    
    var body: some View {
        if let user = userManager.user {
            NavigationStack {
                Form {
                    Section {
                        Text(user.name)
                            .textSelection(.enabled)
                    } header: {
                        Text("Name")
                    } footer: {
                        Text("To update this information, contact us at [app@sstaa.org](app@sstaa.org).")
                    }
                    
                    if let email = userManager.firebaseUser?.email {
                        Section("Email") {
                            Text(email)
                                .textSelection(.enabled)
                        }
                    }
                    
                    Section("Graduation Year") {
                        Text("Class of \(String(user.graduationYear))")
                            .textSelection(.enabled)
                    }
                    
                    NavigationLink("Acknowledgements") {
                        AcknowledgementsView()
                    }
                    
                    Section {
                        Button(role: .destructive) {
                            userManager.signOut()
                        } label: {
                            Text("Sign Out")
                        }
                        
                        Button(role: .destructive) {
                            isDeleteAccountSheetPresented = true
                        } label: {
                            Text("Delete & Unlink My Account")
                        }
                        .sheet(isPresented: $isDeleteAccountSheetPresented) {
                            DeleteAccountView()
                                .presentationDetents([.medium])
                        }
                    }
                }
                .navigationTitle("Profile")
            }
        } else {
            Text("Something went wrong.")
        }
    }
}
