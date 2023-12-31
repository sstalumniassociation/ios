//
//  SecurityAccessAdmittedView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import SwiftUI
import ScreenCaptureRedaction

struct SecurityAccessAdmittedView: View {
    
    @ObservedObject var securityAccessManager: SecurityAccessManager
    @State private var originalBrightnessValue = UIScreen.main.brightness
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        VStack(spacing: 0) {
            Text(securityAccessManager.authorizationRequestDateString)
                .font(.system(size: 40, weight: .heavy))
                .padding(4)
                .padding(.horizontal, 4)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            Text(securityAccessManager.authorizationRequestTimeString)
                .font(.system(size: 40, weight: .semibold))
                .padding(4)
                .padding(.horizontal, 4)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            
            Text("Alumnus")
                .font(.system(size: 32, weight: .regular))
                .padding(4)
                .padding(.horizontal, 4)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        .redactWhenScreenRecorded()
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
