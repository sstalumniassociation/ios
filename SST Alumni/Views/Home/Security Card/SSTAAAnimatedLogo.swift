//
//  SSTAAAnimatedLogo.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import SwiftUI
import ScreenCaptureRedaction

struct SSTAAAnimatedLogo: View {
    
    var isAnimating = false
    
    private let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State private var logoIndex = 1
    
    var body: some View {
        ScreenCaptureRedactionView {
            ZStack {
                Image(.logoWhite)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.3)
                
                if isAnimating {
                    ForEach(1..<7) { index in
                        if index <= logoIndex {
                            Image("LogoWhite\(index)")
                                .resizable()
                                .scaledToFit()
                                .transition(.scale(scale: 0.8, anchor: .leading).combined(with: .opacity))
                        }
                    }
                }
                Image(.logoWhiteSSTOnly)
                    .resizable()
                    .scaledToFit()
            }
        } replacingWith: {
            Rectangle()
                .fill(.white.opacity(0.1))
                .overlay {
                    Image(systemName: "eyes")
                        .resizable()
                        .scaledToFit()
                }
                .aspectRatio(512 / 302, contentMode: .fit)
        }
        .frame(height: 48)
        .onReceive(timer) { _ in
            guard isAnimating else { return }
            
            withAnimation(.spring(response: 0.5, dampingFraction: 0.3)) {
                logoIndex += 1
                if logoIndex == 8 {
                    logoIndex = 1
                }
            }
        }
    }
}

#Preview {
    SSTAAAnimatedLogo()
}
