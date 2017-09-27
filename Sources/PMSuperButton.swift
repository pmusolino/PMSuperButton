//
//  PMSuperButton.swift
//  PMSuperButton
//
//  Created by Paolo Musolino on 14/06/17.
//  Copyright © 2017 PMSuperButton. All rights reserved.
//

import UIKit

@IBDesignable
open class PMSuperButton: UIButton {
    
    //MARK: - General Appearance
    @IBInspectable open var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable open var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable open var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable open var shadowColor: UIColor = UIColor.clear{
        didSet{
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable open var shadowOpacity: Float = 0{
        didSet{
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    @IBInspectable open var shadowOffset: CGSize = CGSize.zero{
        didSet{
            self.layer.shadowOffset = shadowOffset
        }
    }
    @IBInspectable open var shadowRadius: CGFloat = 0{
        didSet{
            self.layer.shadowRadius = shadowRadius
        }
    }
    @IBInspectable open var gradientEnabled: Bool = false{
        didSet{
            setupGradient()
        }
    }
    
    //MARK: - Gradient Background
    @IBInspectable open var gradientStartColor: UIColor = UIColor.clear{
        didSet{
            setupGradient()
        }
    }
    @IBInspectable open var gradientEndColor: UIColor = UIColor.clear{
        didSet{
            setupGradient()
        }
    }
    @IBInspectable open var gradientHorizontal: Bool = false{
        didSet{
            setupGradient()
        }
    }
    var gradient: CAGradientLayer?
    
    func setupGradient(){
        guard gradientEnabled != false else{
            return
        }
        
        gradient?.removeFromSuperlayer()
        gradient = CAGradientLayer()
        gradient!.frame = self.layer.bounds
        gradient!.colors = [gradientStartColor.cgColor, gradientEndColor.cgColor]
        gradient!.startPoint = CGPoint(x: 0, y: 0)
        if (gradientHorizontal){
            gradient!.endPoint = CGPoint(x: 1, y: 0)
        }else{
            gradient!.endPoint = CGPoint(x: 0, y: 1)
        }
        self.layer.insertSublayer(gradient!, below: self.imageView?.layer)
    }
    
    //MARK: - Animations
    @IBInspectable open var animatedScaleWhenHighlighted: CGFloat = 1.0
    @IBInspectable open var animatedScaleDurationWhenHightlighted: Double = 0.2
    
    override open var isHighlighted: Bool {
        didSet {
            guard animatedScaleWhenHighlighted != 1.0 else {
                return
            }
            
            if isHighlighted{
                UIView.animate(withDuration: animatedScaleDurationWhenHightlighted, animations: {
                    self.transform = CGAffineTransform(scaleX: self.animatedScaleWhenHighlighted, y: self.animatedScaleWhenHighlighted)
                })
            }
            else{
                UIView.animate(withDuration: animatedScaleDurationWhenHightlighted, animations: {
                    self.transform = CGAffineTransform.identity
                })
            }
        }
    }
    
    @IBInspectable open var animatedScaleWhenSelected: CGFloat = 1.0
    @IBInspectable open var animatedScaleDurationWhenSelected: Double = 0.2
    
    override open var isSelected: Bool{
        didSet {
            guard animatedScaleWhenSelected != 1.0 else {
                return
            }
            
            UIView.animate(withDuration: animatedScaleDurationWhenSelected, animations: {
                self.transform = CGAffineTransform(scaleX: self.animatedScaleWhenSelected, y: self.animatedScaleWhenSelected)
            }) { (finished) in
                UIView.animate(withDuration: self.animatedScaleDurationWhenSelected, animations: {
                    self.transform = CGAffineTransform.identity
                })
            }
        }
    }
    
    //MARK: - Ripple button
    @IBInspectable open var ripple: Bool = false{
        didSet{
            self.clipsToBounds = true
        }
    }
    @IBInspectable open var rippleColor: UIColor = UIColor(white: 1.0, alpha: 0.3)
    @IBInspectable open var rippleSpeed: Double = 1.0
    
    //MARK: - Checkbox
    @IBInspectable open var checkboxButton: Bool = false{
        didSet{
            if checkboxButton == true{
                self.setImage(uncheckedImage, for: .normal)
                self.setImage(checkedImage, for: .selected)
                self.addTarget(self, action: #selector(buttonChecked), for: .touchUpInside)
            }
        }
    }
    @IBInspectable open var checkedImage: UIImage?
    @IBInspectable open var uncheckedImage: UIImage?
    
    func buttonChecked(sender:AnyObject){
        self.isSelected = !self.isSelected
    }
    
    //MARK: - Material Circle Loader Button
    // circle loader variables
    @IBInspectable open var showCircleLoader: Bool = false
    @IBInspectable open var circleLoaderColor: UIColor? = UIColor.clear
    private var copyTitle: String? = ""
    
    override open var layer: CAShapeLayer {
        get {
            return super.layer as! CAShapeLayer
        }
    }
    
    override open class var layerClass: AnyClass { return CAShapeLayer.self }
    
    // circle loader set up
    private func setUpCircleLoader() {
        layer.fillColor = nil
        layer.strokeColor = circleLoaderColor?.cgColor
        layer.lineWidth = 1.5
        setPath()
        layoutIfNeeded()
    }
    
    private func setPath() {
        layer.path = UIBezierPath(ovalIn: bounds.insetBy(dx: layer.lineWidth / 2, dy: layer.lineWidth / 2)).cgPath
    }

    
    //Animation set up
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
    private var delays: [Delay] {
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
    
    //Animation actions
    private func startCircleLoaderAnimation() {
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
    
    private func stopCircleLoaderAnimation() {
        layer.removeAllAnimations()
        layer.strokeColor = UIColor.clear.cgColor
        layer.lineWidth = 0.0
    }
    
    private func animateKeyPath(keyPath: String, duration: CFTimeInterval, times: [CFTimeInterval], values: [CGFloat]) {
        let animation = CAKeyframeAnimation(keyPath: keyPath)
        animation.keyTimes = times as [NSNumber]?
        animation.values = values
        animation.calculationMode = kCAAnimationLinear
        animation.duration = duration
        animation.repeatCount = Float.infinity
        layer.add(animation, forKey: animation.keyPath)
    }
    
    // Public
    open func showCircleLoader(userInteraction: Bool = true){
        guard showCircleLoader else {
            return
        }
        let rippleAnimDelay = ripple ? rippleSpeed : 0.5
        UIView.animate(withDuration: 0.1, delay: rippleAnimDelay, options: [.curveLinear], animations: {
            self.copyTitle = self.title(for: .normal)
            self.imageAlpha = 0.0
            self.transform = .init(scaleX: 0.2, y: 1.0)
        }) { (completion) in
            self.setTitle("", for: .normal)
            self.layer.borderColor = UIColor.clear.cgColor
            
            self.setUpCircleLoader()
            self.startCircleLoaderAnimation()
        }
    }
    
    open func hideCircleLoader(){
        guard showCircleLoader else {
            return
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveLinear], animations: {
            self.stopCircleLoaderAnimation()
        }) { (completion) in
            self.transform = .identity
            self.imageAlpha = 1.0
            self.layer.borderColor = self.borderColor.cgColor
            self.setTitle(self.copyTitle, for: .normal)
        }
    }
    
    //MARK: - Image
    ///Image UIButton content mode
    @IBInspectable open var imageViewContentMode: Int = UIViewContentMode.scaleToFill.rawValue{
        didSet{
            imageView?.contentMode = UIViewContentMode(rawValue: imageViewContentMode) ?? .scaleToFill
        }
    }
    @IBInspectable open var imageAlpha: CGFloat = 1.0 {
        didSet {
            if let imageView = imageView {
                imageView.alpha = imageAlpha
            }
        }
    }
    
    //MARK: - Action Closure
    private var action: (() -> Void)?
    
    open func touchUpInside(action: (() -> Void)? = nil){
        self.action = action
    }
    
    func tapped(sender: PMSuperButton) {
        self.action?()
    }
    
    //MARK: - Loading
    let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    /**
     Show a loader inside the button, and enable or disable user interection while loading
     */
    open func showLoader(userInteraction: Bool = true){
        guard self.subviews.contains(indicator) == false else {
            return
        }
        self.isUserInteractionEnabled = userInteraction
        indicator.isUserInteractionEnabled = false
        indicator.center = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
        UIView.transition(with: self, duration: 0.5, options: .curveEaseOut, animations: {
            self.titleLabel?.alpha = 0.0
            self.imageAlpha = 0.0
        }) { (finished) in
            self.addSubview(self.indicator)
            self.indicator.startAnimating()
        }
    }
    
    open func hideLoader(){
        guard self.subviews.contains(indicator) == true else {
            return
        }
        
        self.isUserInteractionEnabled = true
        self.indicator.stopAnimating()
        self.indicator.removeFromSuperview()
        UIView.transition(with: self, duration: 0.5, options: .curveEaseIn, animations: {
            self.titleLabel?.alpha = 1.0
            self.imageAlpha = 1.0
        }) { (finished) in
        }
    }
    
    //MARK: - Interface Builder Methods
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.alpha = imageAlpha
        self.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    override open func prepareForInterfaceBuilder() {
    }
}

extension PMSuperButton: CAAnimationDelegate{
    
    //MARK: Material touch animation for ripple button
    open override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        guard ripple == true else {
            return true
        }
        
        let tapLocation = touch.location(in: self)
        
        let aLayer = CALayer()
        aLayer.backgroundColor = rippleColor.cgColor
        let initialSize: CGFloat = 20.0
        
        aLayer.frame = CGRect(x: 0, y: 0, width: initialSize, height: initialSize)
        aLayer.cornerRadius = initialSize/2
        aLayer.masksToBounds = true
        aLayer.position = tapLocation
        self.layer.insertSublayer(aLayer, below: self.titleLabel?.layer)
        
        // Create a basic animation changing the transform.scale value
        let animation = CABasicAnimation(keyPath: "transform.scale")
        
        // Set the initial and the final values+
        animation.toValue = 10.5 * max(self.frame.size.width, self.frame.size.height) / initialSize
        
        // Set duration
        animation.duration = rippleSpeed
        
        // Set animation to be consistent on completion
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        // Add animation to the view's layer
        let fade = CAKeyframeAnimation(keyPath: "opacity")
        fade.values = [1.0, 1.0, 0.5, 0.5, 0.0]
        fade.duration = 0.5
        
        let animGroup = CAAnimationGroup()
        animGroup.duration = 0.5
        animGroup.delegate = self
        animGroup.animations = [animation, fade]
        animGroup.setValue(aLayer, forKey: "animationLayer")
        aLayer.add(animGroup, forKey: "scale")
        
        return true
    }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let layer: CALayer? = anim.value(forKeyPath: "animationLayer") as? CALayer
        if layer != nil{
            layer?.removeAnimation(forKey: "scale")
            layer?.removeFromSuperlayer()
        }
    }
}
