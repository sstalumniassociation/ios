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

@available(iOS 17.0, *)
@Observable
class ShimmerManager {
    var motionManager = CMMotionManager()
    
    var hideShimmer: Bool = false
    var horizontalValue = 0.0
    
    var shimmerRotation: Angle = .zero
    
    init() {
        motionManager.startAccelerometerUpdates()
        
        motionManager.accelerometerUpdateInterval = 0.1
        
        powerStateChanged()
        
        NotificationCenter.default.addObserver(self, selector: #selector(powerStateChanged), name: Notification.Name.NSProcessInfoPowerStateDidChange, object: nil)
    }
    
    @objc func powerStateChanged() {
        let lowPowerEnabled = ProcessInfo.processInfo.isLowPowerModeEnabled
        
        if lowPowerEnabled {
            hideShimmer = true
            motionManager.stopAccelerometerUpdates()
        } else {
            hideShimmer = false
            motionManager.startAccelerometerUpdates(to: .main) { [self] data, _ in
                guard let data = data else { return }
                
                // swiftlint:disable identifier_name
                let x = data.acceleration.x
                let y = data.acceleration.y
                let z = data.acceleration.z
                
                self.horizontalValue = x
                
                let newShimmerRotation = Angle(radians: atan2(y / 6, z / 6))
                
                if abs(newShimmerRotation.degrees - shimmerRotation.degrees) > 180 {
                    self.shimmerRotation = Angle(degrees: newShimmerRotation.degrees + 360)
                } else {
                    self.shimmerRotation = newShimmerRotation
                }
                // swiftlint:enable identifier_name
            }
        }
    }
}
