//
//  ContentView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(UserManager.self) var userManager
    
    @State private var selectedTab: AppState = .home
    
    var body: some View {
        if userManager.firebaseUser != nil {
            if userManager.emailVerificationState != .verified {
                AuthenticationEmailVerificationRequired()
            } else {
                if userManager.user != nil {
                    TabView(selection: $selectedTab) {
                        Tab("Home",
                            systemImage: "house.fill",
                            value: AppState.home) {
                            HomeView(appState: $selectedTab)
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
                } else {
                    AuthenticationLoadingView(systemName: "arrow.down.circle",
                                              title: "Syncing User Data…")
                }
            }
        } else {
            OnboardingView()
        }
    }
}

#Preview {
    ContentView()
}
