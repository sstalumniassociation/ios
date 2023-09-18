//
//  MegaphoneOnboardingItemView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 18/9/23.
//

import SwiftUI

struct MegaphoneOnboardingItemView: View {
    
    var selection: OnboardingState
    
    @State private var isAnimated = false
    
    var body: some View {
        OnboardingItemView(title: "Hear about SST Alumni events", 
                           description: "Be the first to find out about SST alumni events.") {
            Image(systemName: "megaphone.fill")
                .foregroundStyle(.blue)
                .rotationEffect(isAnimated ? .degrees(-20) : .degrees(0))
                .scaleEffect(isAnimated ? 1 : 0.8, anchor: .bottomLeading)
        }
        .tag(OnboardingState.announcements)
        .onChange(of: selection) { newValue in
            if newValue == .announcements {
                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.3).delay(0.25)) {
                    isAnimated = true
                }
            } else {
                isAnimated = false
            }
        }
    }
}
