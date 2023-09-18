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
            .animation(.easeInOut, value: onboardingSelection)
            
            VStack(alignment: .leading) {
                TabView(selection: $onboardingSelection) {
                    WelcomeOnboardingItemView()
                        .tag(OnboardingState.welcome)
                    
                    SecurityPassOnboardingItemView(selection: onboardingSelection)
                    
                    MegaphoneOnboardingItemView(selection: onboardingSelection)
                    
                    BookVenueOnboardingItemView(selection: onboardingSelection)
                }
                .tabViewStyle(.page)
                
                HStack {
                    Button {
                        userManager.signIn()
                    } label: {
                        Text("Sign In")
                            .frame(maxWidth: .infinity)
                            .padding(8)
                    }
                    .buttonStyle(.bordered)
                    .background(.background)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Button {
                        
                    } label: {
                        Text("Sign Up")
                            .frame(maxWidth: .infinity)
                            .padding(8)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
        }
    }
}

#Preview {
    OnboardingView()
}
