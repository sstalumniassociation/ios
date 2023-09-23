//
//  WelcomeOnboardingItemView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 18/9/23.
//

import SwiftUI

struct WelcomeOnboardingItemView: View {
    
    private let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State private var logoIndex = 1
    
    var body: some View {
        OnboardingItemView(title: "SST Alumni App",
                           description: "Access alumni services, a security pass, and more!") {
            ZStack {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.3)
                ForEach(1..<7) { index in
                    if index <= logoIndex {
                        Image(.logo)
                            .resizable()
                            .scaledToFit()
                            .mask({
                                Image("LogoWhite\(index)")
                                    .resizable()
                                    .scaledToFit()
                            })
                            .transition(.scale(scale: 0.8, anchor: .leading).combined(with: .opacity))
                    }
                }
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .mask({
                        Image(.logoWhiteSSTOnly)
                            .resizable()
                            .scaledToFit()
                    })
            }
        }
        .onReceive(timer) { _ in
            withAnimation(.spring(response: 0.5, dampingFraction: 0.4)) {
                logoIndex += 1
            }
        }
    }
}

#Preview {
    WelcomeOnboardingItemView()
}
