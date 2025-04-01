//
//  ConfettiBackgroundView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 4/1/25.
//

import SwiftUI
import ScreenCaptureRedaction

struct ConfettiBackgroundView: View {
    
    var isCardExpanded: Bool
    var isConfettiAnimating: Bool
    
    var body: some View {
        if isCardExpanded && isConfettiAnimating {
            ScreenCaptureRedactionView {
                GeometryReader { geometry in
                    ConfettiView(size: geometry.size)
                }
            } replacingWith: {
                Rectangle()
                    .opacity(0)
            }
        }
    }
}
