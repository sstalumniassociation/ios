//
//  ScreenCaptureRedactionView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import SwiftUI

struct ScreenCaptureRedactionView<Content: View>: View {
    @ViewBuilder
    var content: (() -> Content)
    
    var body: some View {
        if #available(iOS 17.0, *) {
            ScreenCaptureRedactionViewNew {
                content()
            }
        } else {
            ScreenCaptureRedactionViewOld {
                content()
            }
        }
    }
}

@available(iOS 17.0, *)
struct ScreenCaptureRedactionViewNew<Content: View>: View {
    
    @Environment(\.isSceneCaptured) var isSceneCaptured
    @Environment(\.scenePhase) var scenePhase
    
    @ViewBuilder
    var content: (() -> Content)
    
    var body: some View {
        if isSceneCaptured || scenePhase != .active {
            content()
                .redacted(reason: .placeholder)
        } else {
            content()
        }
    }
}

@available(iOS, obsoleted: 17.0, message: "Use ScreenCaptureRedactionViewNew instead.")
struct ScreenCaptureRedactionViewOld<Content: View>: View {
    
    @State private var isSceneCaptured = UIScreen.main.isCaptured
    @Environment(\.scenePhase) var scenePhase
    
    @ViewBuilder
    var content: (() -> Content)
    
    var body: some View {
        Group {
            if isSceneCaptured || scenePhase != .active {
                content()
                    .redacted(reason: .placeholder)
            } else {
                content()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIScreen.capturedDidChangeNotification)) { _ in
            isSceneCaptured = UIScreen.main.isCaptured
        }
    }
}
