//
//  AuthenticationLoadingView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 21/9/23.
//

import SwiftUI

struct AuthenticationLoadingView: View {
    
    var systemName: String
    var title: String
    
    var body: some View {
        VStack {
            Image(systemName: systemName)
                .foregroundStyle(.blue)
                .frame(height: 96)
                .font(.system(size: 64))
                .padding(.top)
                .accessibilityHidden(true)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .multilineTextAlignment(.center)
            
            ProgressView()
            
            Spacer()
        }
        .padding()
    }
}
