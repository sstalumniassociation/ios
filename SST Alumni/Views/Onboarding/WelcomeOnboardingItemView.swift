//
//  WelcomeOnboardingItemView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 18/9/23.
//

import SwiftUI
import LogoKit

struct WelcomeOnboardingItemView: View {
    var body: some View {
        OnboardingItemView(title: "SST Alumni App",
                           description: "Access alumni services, a security pass, and more!") {
            Logo(style: .animated)
        }
    }
}

#Preview {
    WelcomeOnboardingItemView()
}
