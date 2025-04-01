//
//  Logo.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 2/4/25.
//

import SwiftUI
import ScreenCaptureRedaction

@available(iOS 17.0, *)
public struct Logo: View {
    
    var style: LogoStyle
    var redactWhenScreenCaptured: Bool = false
    
    public init(style: LogoStyle, redactWhenScreenCaptured: Bool = false) {
        self.style = style
        self.redactWhenScreenCaptured = redactWhenScreenCaptured
    }
    
    public var body: some View {
        if redactWhenScreenCaptured {
            ScreenCaptureRedactionView {
                LogoView(style: style)
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
        } else {
            LogoView(style: style)
        }
    }
}
