//
//  ContentView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var userManager = UserManager()
    
    var body: some View {
        if let firebaseUser = userManager.firebaseUser {
            if userManager.emailVerificationState != .verified {
                AuthenticationEmailVerificationRequired()
                    .environmentObject(userManager)
            } else {
                if let user = userManager.user {
                    TabView {
                        HomeView(user: user)
                            .tabItem {
                                Label("Home", systemImage: "house.fill")
                            }
                        
                        AlumniServicesView()
                            .tabItem {
                                Label("Services", systemImage: "sparkles")
                            }
                        
                        EventsView()
                            .tabItem {
                                Label("Events", systemImage: "calendar")
                            }
                        
                        UserProfileView()
                            .tabItem {
                                Label("Profile", systemImage: "person.crop.circle.fill")
                            }
                    }
                    .environmentObject(userManager)
                } else {
                    AuthenticationLoadingView(systemName: "arrow.down.circle",
                                              title: "Syncing User Data…")
                    .task {
                        await userManager.fetchUserData()
                    }
                }
            }
        } else {
            OnboardingView()
                .environmentObject(userManager)
        }
    }
}

#Preview {
    ContentView()
}
