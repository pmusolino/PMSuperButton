//
//  MaterialCircleLoader.swift
//  PMSuperButton
//
//  Created by Francesco Deliro on 10/07/2017.
//  Copyright © 2017 PMSuperButton. All rights reserved.
//

import UIKit

class MaterialCircleLoader: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addGesture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var layer: CAShapeLayer {
        get {
            return super.layer as! CAShapeLayer
        }
    }
    
    var strokeColor: CGColor? = UIColor.white.cgColor {
        didSet{
            layoutSubviews()
        }
    }
    
    override public class var layerClass: AnyClass { return CAShapeLayer.self }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.fillColor = nil
        layer.strokeColor = strokeColor
        layer.lineWidth = 1.5
        setPath()
    }
    
    //MARK: - Actions
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.checkAction(sender:)))
        self.addGestureRecognizer(gesture)
    }
    // Closure
    open var touchAction: (() -> Void)?
    
    func checkAction(sender : UITapGestureRecognizer) {
        self.touchAction?()
    }
    
    private func setPath() {
        layer.path = UIBezierPath(ovalIn: bounds.insetBy(dx: layer.lineWidth / 2, dy: layer.lineWidth / 2)).cgPath
    }
    
    struct Delay {
        let secondsSincePriorDelay: CFTimeInterval
        let start: CGFloat
        let length: CGFloat
        init(_ secondsSincePriorDelay: CFTimeInterval, _ start: CGFloat, _ length: CGFloat) {
            self.secondsSincePriorDelay = secondsSincePriorDelay
            self.start = start
            self.length = length
        }
    }
    
    // Rotation delay
    var delays: [Delay] {
        return [
            Delay(0.0, 0.000, 0.7),
            Delay(0.2, 0.500, 0.5),
            Delay(0.2, 1.000, 0.3),
            Delay(0.2, 1.500, 0.1),
            Delay(0.2, 1.875, 0.1),
            Delay(0.2, 2.250, 0.3),
            Delay(0.2, 2.625, 0.5),
            Delay(0.2, 3.000, 0.7),
        ]
    }
    
    func startAnimation() {
        var time: CFTimeInterval = 0
        var times = [CFTimeInterval]()
        var start: CGFloat = 0
        var rotations = [CGFloat]()
        var strokeEnds = [CGFloat]()
        
        let totalSeconds = self.delays.reduce(0) { $0 + $1.secondsSincePriorDelay }
        
        for Delay in self.delays {
            time += Delay.secondsSincePriorDelay
            times.append(time / totalSeconds)
            start = Delay.start
            rotations.append(start * 2 * CGFloat(Double.pi))
            strokeEnds.append(Delay.length)
        }
        
        times.append(times.last!)
        rotations.append(rotations[0])
        strokeEnds.append(strokeEnds[0])
        
        animateKeyPath(keyPath: "strokeEnd", duration: totalSeconds, times: times, values: strokeEnds)
        animateKeyPath(keyPath: "transform.rotation", duration: totalSeconds, times: times, values: rotations)
    
    }
    
    func stopAnimation() {
        removeFromSuperview()
    }
    
    func animateKeyPath(keyPath: String, duration: CFTimeInterval, times: [CFTimeInterval], values: [CGFloat]) {
        let animation = CAKeyframeAnimation(keyPath: keyPath)
        animation.keyTimes = times as [NSNumber]?
        animation.values = values
        animation.calculationMode = kCAAnimationLinear
        animation.duration = duration
        animation.repeatCount = Float.infinity
        layer.add(animation, forKey: animation.keyPath)
    }
    
}
