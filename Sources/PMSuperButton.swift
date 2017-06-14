//
//  PMSuperButton.swift
//  PMSuperButton
//
//  Created by Paolo Musolino on {TODAY}.
//  Copyright © 2017 PMSuperButton. All rights reserved.
//

import UIKit

@IBDesignable
class PMSuperButton: UIButton {
    
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
    
    //Image inside UIButton
    @IBInspectable var imageContentMode: Int = UIViewContentMode.scaleToFill.rawValue{
        didSet{
            imageView?.contentMode = UIViewContentMode(rawValue: imageContentMode) ?? .scaleToFill
        }
    }
    
    private var action: (() -> Void)?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    override func prepareForInterfaceBuilder() {
    }
    
    func buttonChecked(sender:AnyObject){
        self.isSelected = !self.isSelected
    }
    
    //MARK: Action Closure
    func touchUpInside(action: (() -> Void)? = nil){
        self.action = action
    }
    
    func tapped(sender: PMSuperButton) {
        self.action?()
    }
}
