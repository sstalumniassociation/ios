//
//  SecurityAccessAdmittedView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import SwiftUI

struct SecurityAccessAdmittedView: View {
    
    @ObservedObject var securityAccessManager: SecurityAccessManager
    @State private var originalBrightnessValue = UIScreen.main.brightness
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        ScreenCaptureRedactionView {
            VStack {
                Text(securityAccessManager.authorizationRequestDateString)
                    .font(.system(size: 40, weight: .heavy))
                
                Text(securityAccessManager.authorizationRequestTimeString)
                    .font(.system(size: 40, weight: .semibold))
                
                Text("Alumnus")
                    .font(.system(size: 32, weight: .regular))
            }
        }
        .foregroundStyle(.black)
        .padding()
        .onAppear {
            UIScreen.main.brightness = 1
        }
        .onDisappear {
            UIScreen.main.brightness = originalBrightnessValue
        }
        .onChange(of: scenePhase) { newValue in
            if newValue != .active {
                UIScreen.main.brightness = originalBrightnessValue
            }
        }
    }
}
