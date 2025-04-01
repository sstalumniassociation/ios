//
//  SSTAAAnimatedLogo.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import SwiftUI
import ScreenCaptureRedaction

struct SSTAAAnimatedLogo: View {
    
    private let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State private var logoIndex = 1
    
    var isWhite: Bool
    
    var logoAsset: String {
        isWhite ? "LogoWhite" : "Logo"
    }
    
    var body: some View {
        ZStack {
            Image(logoAsset)
                .resizable()
                .scaledToFit()
                .opacity(0.3)
            
            ForEach(1..<7) { index in
                if index <= logoIndex {
                    Image(logoAsset)
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
            
            Image(logoAsset)
                .resizable()
                .scaledToFit()
                .mask({
                    Image(.logoWhiteSSTOnly)
                        .resizable()
                        .scaledToFit()
                })
        }
        .frame(height: 48)
        .onReceive(timer) { _ in
            withAnimation(.spring(response: 0.5, dampingFraction: 0.3)) {
                logoIndex += 1
                if logoIndex == 8 {
                    logoIndex = 1
                }
            }
        }
    }
}
