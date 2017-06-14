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
    
    //checkbox button functionality
    @IBInspectable var checkboxButton: Bool = false
    @IBInspectable var uncheckedImage: UIImage = UIImage()
    @IBInspectable var checkedImage: UIImage = UIImage()
    
    //Image inside UIButton
    @IBInspectable var imageViewContentMode: Int = UIViewContentMode.scaleToFill.rawValue
    
    private var action: (() -> Void)?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.customize()
        self.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    override func prepareForInterfaceBuilder() {
        customize()
    }
    
    func customize(){
//        self.layer.borderColor = borderColor.cgColor
//        self.layer.borderWidth = borderWidth
//        self.layer.cornerRadius = cornerRadius
//        self.layer.shadowColor = shadowColor.cgColor
//        self.layer.shadowOpacity = shadowOpacity
//        self.layer.shadowOffset = shadowOffset
//        self.layer.shadowRadius = shadowRadius
        
        if checkboxButton == true{
            self.setImage(self.uncheckedImage, for: .normal)
            self.setImage(self.checkedImage, for: .selected)
            self.addTarget(self, action: #selector(buttonChecked), for: .touchUpInside)
        }
        
        imageView?.contentMode = UIViewContentMode(rawValue: imageViewContentMode) ?? .scaleToFill
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
