//
//  ContentView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var userManager = UserManager()
    
    @State private var selectedTab: AppState = .home
    
    var body: some View {
        if userManager.firebaseUser != nil {
            if userManager.emailVerificationState != .verified {
                AuthenticationEmailVerificationRequired()
                    .environmentObject(userManager)
            } else {
                if let user = userManager.user {
                    TabView(selection: $selectedTab) {
                        Tab("Home",
                            systemImage: "house.fill",
                            value: AppState.home) {
                            HomeView(user: user)
                        }
                        
                        Tab("Events",
                            systemImage: "calendar",
                            value: AppState.events) {
                            EventsView()
                        }
                        
                        Tab("Services",
                            systemImage: "sparkles",
                            value: AppState.alumniServices) {
                            AlumniServicesView()
                        }
                        
                        Tab("Profile",
                            systemImage: "person.crop.circle.fill",
                            value: AppState.profile) {
                            UserProfileView()
                        }
                    }
                    .environmentObject(userManager)
                } else {
                    AuthenticationLoadingView(systemName: "arrow.down.circle",
                                              title: "Syncing User Data…")
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
