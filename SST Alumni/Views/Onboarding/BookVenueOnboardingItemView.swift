//
//  BookVenueOnboardingItemView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 18/9/23.
//

import SwiftUI

struct BookVenueOnboardingItemView: View {
    
    var selection: OnboardingState
    
    @State private var isAnimated = false
    
    var body: some View {
        OnboardingItemView(title: "Loan Venues", description: "Need some space for a badminton match? Book venues within the school!") {
            HStack(alignment: .bottom, spacing: -16) {
                Image(systemName: "sportscourt")
                    .foregroundStyle(.gray)
                
                if isAnimated {
                    Image(systemName: "checkmark.circle.fill")
                        .symbolRenderingMode(.multicolor)
                        .resizable()
                        .frame(width: 32, height: 32)
                }
            }
        }
        .tag(OnboardingState.loanVenues)
        .onChange(of: selection) { newValue in
            if newValue == .loanVenues {
                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.3).delay(0.25)) {
                    isAnimated = true
                }
            } else {
                isAnimated = false
            }
        }
    }
}
