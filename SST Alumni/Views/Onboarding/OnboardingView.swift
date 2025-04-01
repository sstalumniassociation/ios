//
//  OnboardingView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    @State private var onboardingSelection = OnboardingState.welcome
    @State private var isAuthenticationPresented = false
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image(.randomSpot1)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(onboardingSelection == .welcome ? .red : onboardingSelection.color)
                    .frame(height: geometry.size.height / 2, alignment: .leading)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                Image(.randomSpot2)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(onboardingSelection == .welcome ? .blue : onboardingSelection.color)
                    .frame(width: geometry.size.width / 6 * 5, alignment: .trailing)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding(.bottom)
                
                Image(.randomSpot3)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(onboardingSelection == .welcome ? .gray : onboardingSelection.color)
                    .frame(width: geometry.size.width / 6 * 5, alignment: .leading)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            .opacity(0.2)
            .accessibilityHidden(true)
            .animation(.easeInOut, value: onboardingSelection)
            
            VStack(alignment: .leading) {
                TabView(selection: $onboardingSelection) {
                    Tab(value: .welcome) {
                        WelcomeOnboardingItemView()
                    }
                    
                    Tab(value: OnboardingState.security) {
                        SecurityPassOnboardingItemView(selection: onboardingSelection)
                    }
                    
                    Tab(value: OnboardingState.announcements) {
                        MegaphoneOnboardingItemView(selection: onboardingSelection)
                    }
                    
                    Tab(value: OnboardingState.loanVenues) {
                        BookVenueOnboardingItemView(selection: onboardingSelection)
                    }
                }
                .tabViewStyle(.page)
                
                Button {
                    isAuthenticationPresented.toggle()
                } label: {
                    Text("Get Started")
                        .frame(maxWidth: .infinity)
                        .padding(8)
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
        .sheet(isPresented: $isAuthenticationPresented) {
            AuthenticationView()
        }
    }
}

#Preview {
    OnboardingView()
}
