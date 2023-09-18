//
//  SecurityPassOnboardingItemView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 18/9/23.
//

import SwiftUI

struct SecurityPassOnboardingItemView: View {
    
    var selection: OnboardingState
    
    @State private var isAnimated = false
    
    var body: some View {
        OnboardingItemView(title: "Virtual Security Pass",
                           description: "Visiting SST? Prove your identity as an alumnus to security.") {
            Image(systemName: "lanyardcard.fill")
                .foregroundStyle(.red)
                .scaleEffect(isAnimated ? 1 : 0.8)
        }
        .tag(OnboardingState.security)
        .onChange(of: selection) { newValue in
            if newValue == .security {
                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.3).delay(0.25)) {
                    isAnimated = true
                }
            } else {
                isAnimated = false
            }
        }
    }
}
