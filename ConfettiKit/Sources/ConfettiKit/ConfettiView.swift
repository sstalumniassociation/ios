//
//  ConfettiView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 23/10/22.
//

#if canImport(SwiftUI) && canImport(UIKit)
import Foundation
import SwiftUI

@available(iOS 15, *)
public struct ConfettiView: UIViewRepresentable {
    
    var size: CGSize
    
    public init(size: CGSize) {
        self.size = size
    }
    
    public func makeUIView(context: Context) -> some UIView {
        let confettiView = ConfettiUIView(frame: .init(origin: .zero, size: size))
        
        confettiView.intensity = 1
        
        confettiView.isUserInteractionEnabled = false
        
        confettiView.startConfetti()
        
        return confettiView
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
#endif
