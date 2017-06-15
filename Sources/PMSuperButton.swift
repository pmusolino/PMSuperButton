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
    
    //MARK: Appearance
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var shadowColor: UIColor = UIColor.clear{
        didSet{
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable var shadowOpacity: Float = 0{
        didSet{
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    @IBInspectable var shadowOffset: CGSize = CGSize.zero{
        didSet{
            self.layer.shadowOffset = shadowOffset
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 0{
        didSet{
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    //MARK: Toggle
    @IBInspectable var toggleButton: Bool = false{
        didSet{
            if toggleButton == true{
                self.setImage(uncheckedImage, for: .normal)
                self.setImage(checkedImage, for: .selected)
                self.addTarget(self, action: #selector(buttonChecked), for: .touchUpInside)
            }
        }
    }
    @IBInspectable var uncheckedImage: UIImage = UIImage()
    @IBInspectable var checkedImage: UIImage = UIImage()
    
    //MARK: Image UIButton content mode
    @IBInspectable var imageContentMode: Int = UIViewContentMode.scaleToFill.rawValue{
        didSet{
            imageView?.contentMode = UIViewContentMode(rawValue: imageContentMode) ?? .scaleToFill
        }
    }
    
    func buttonChecked(sender:AnyObject){
        self.isSelected = !self.isSelected
    }
    
    //MARK: Interface Builder
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    override open func prepareForInterfaceBuilder() {
    }
    
    //MARK: Action Closure
    private var action: (() -> Void)?
    
    open func touchUpInside(action: (() -> Void)? = nil){
        self.action = action
    }
    
    func tapped(sender: PMSuperButton) {
        self.action?()
    }
    
    //MARK: Loading
    let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    open func showLoader(){
        indicator.center = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
        indicator.startAnimating()
        UIView.transition(with: self, duration: 0.5, options: .curveEaseOut, animations: {
            
        }) { (finished) in
            self.addSubview(self.indicator)
        }
    }
    
    open func hideLoader(){
        indicator.removeFromSuperview()
    }
}
