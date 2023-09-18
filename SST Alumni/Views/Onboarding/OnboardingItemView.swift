//
//  OnboardingItemView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 18/9/23.
//

import SwiftUI

enum OnboardingState: Hashable {
    case welcome
    case security
    case announcements
    case loanVenues
    
    var color: Color {
        switch self {
        case .welcome: return .clear
        case .security: return .red
        case .announcements: return .blue
        case .loanVenues: return .gray
        }
    }
}

struct OnboardingItemView<Content: View>: View {
    
    var title: String
    var description: String
    
    @ViewBuilder
    var content: (() -> Content)
    
    var body: some View {
        VStack {
            content()
                .frame(height: 96)
                .font(.system(size: 64))
                .padding(.bottom)
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
