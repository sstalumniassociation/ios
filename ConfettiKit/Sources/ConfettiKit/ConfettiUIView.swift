//
//  ConfettiUIView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 13/6/23.
//
//

#if canImport(UIKit)
import UIKit
import QuartzCore

public class ConfettiUIView: UIView {
    
    var emitter: CAEmitterLayer!
    public var colors: [UIColor]!
    public var intensity: Float!
    
    private var active: Bool!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        colors = [UIColor.systemRed, UIColor.systemBlue, UIColor.systemGray]
        intensity = 1
        active = false
    }
    
    public func startConfetti() {
        emitter = CAEmitterLayer()
        
        emitter.emitterPosition = CGPoint(x: frame.size.width / 2.0, y: 0)
        emitter.emitterShape = .line
        emitter.emitterSize = CGSize(width: frame.size.width, height: 1)
        
        var cells = [CAEmitterCell]()
        for color in colors {
            cells.append(confettiWithColor(color: color))
        }
        
        emitter.emitterCells = cells
        layer.addSublayer(emitter)
        active = true
    }
    
    public func stopConfetti() {
        emitter?.birthRate = 0
        active = false
    }
    
    func imageForType() -> UIImage? {
        return UIImage(named: "confetti")
    }
    
    func confettiWithColor(color: UIColor) -> CAEmitterCell {
        let confetti = CAEmitterCell()
        confetti.birthRate = 10
        confetti.lifetime = 14.0 * intensity
        confetti.lifetimeRange = 0
        confetti.color = color.cgColor
        confetti.velocity = CGFloat(350.0 * intensity)
        confetti.velocityRange = CGFloat(80.0 * intensity)
        confetti.emissionLongitude = .pi
        confetti.emissionRange = .pi / 2
        confetti.spin = 0.5
        confetti.spinRange = 1
        confetti.scaleRange = CGFloat(intensity)
        confetti.scaleSpeed = CGFloat(-0.1 * intensity)
        confetti.contents = imageForType()!.cgImage
        
        return confetti
    }
    
    public func isActive() -> Bool {
        return self.active
    }
}
#endif
