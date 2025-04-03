//
//  SSTAAShimmerLogo.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 4/2/25.
//

import SwiftUI
import CoreMotion
import Observation

@available(iOS 17.0, *)
struct SSTAAShimmerLogo: View {
    
    @State private var shimmerManager = ShimmerManager()
    
    var accent: Color
    
    var body: some View {
        GeometryReader { proxy in
            if !shimmerManager.hideShimmer {
                accent.opacity(0.5).frame(width: proxy.size.width / 4, height: proxy.size.width * 2)
                    .rotationEffect(shimmerManager.shimmerRotation)
                    .position(x: shimmerManager.horizontalValue * Double(proxy.size.width) / 2 + Double(proxy.size.width) / 2, y: Double(proxy.size.height) / 2)
            }
        }
        .animation(.smooth, value: shimmerManager.horizontalValue)
        .background(Color.white)
        .blur(radius: 5)
        .aspectRatio(512 / 302, contentMode: .fit)
        .mask {
            Image(.logoWhite)
                .resizable()
                .scaledToFit()
        }
        .frame(height: 48)
    }
}
