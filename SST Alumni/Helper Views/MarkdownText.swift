//
//  MarkdownText.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 24/9/23.
//

import SwiftUI

extension Text {
    init(markdown: String) {
        self.init((try? AttributedString(markdown: markdown)) ?? AttributedString(markdown))
    }
}
