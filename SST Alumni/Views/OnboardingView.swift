//
//  OnboardingView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            Button {
                userManager.signIn()
            } label: {
                Text("Sign In")
                    .frame(maxWidth: .infinity)
            }
            
            Button {
                
            } label: {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
            }
        }
        .padding()
    }
}

#Preview {
    OnboardingView()
}
