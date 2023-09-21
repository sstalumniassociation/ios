//
//  UserProfileView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 19/9/23.
//

import SwiftUI

struct UserProfileView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        if let user = userManager.user {
            NavigationStack {
                Form {
                    NavigationLink("Acknowledgements") {
                        AcknowledgementsView()
                    }
                    
                    Section {
                        Button(role: .destructive) {
                            userManager.signOut()
                        } label: {
                            Text("Sign Out")
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
