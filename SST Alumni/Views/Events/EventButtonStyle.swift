//
//  EventButtonStyle.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 4/3/25.
//

import Foundation
import SwiftUI

struct EventButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.smooth(duration: 0.25), value: configuration.isPressed)
    }
}
