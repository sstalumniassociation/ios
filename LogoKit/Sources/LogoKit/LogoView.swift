//
//  LogoView.swift
//  LogoKit
//
//  Created by Jia Chen Yee on 4/2/25.
//

import Foundation
import SwiftUI

@available(iOS 17.0, *)
struct LogoView: View {
    
    var style: LogoStyle
    
    var body: some View {
        switch style {
        case .standard:
            Image(.logo)
                .resizable()
                .scaledToFit()
        case .colored(let color):
            Image(.logoWhite)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundColor(color)
        case .shimmering(let color):
            SSTAAShimmerLogo(accent: color)
        case .gradient(let array):
            Image(.logoWhite)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundStyle(LinearGradient(colors: array, startPoint: .topLeading, endPoint: .bottomTrailing))
        case .animated:
            SSTAAAnimatedLogo(isWhite: false)
        case .animatedWhite:
            SSTAAAnimatedLogo(isWhite: true)
        }
    }
}
