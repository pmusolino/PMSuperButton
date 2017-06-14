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
    
    private var action: (() -> Void)?
    
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var shadowColor: UIColor = UIColor.clear
    @IBInspectable var shadowOpacity: Float = 0
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0)
    @IBInspectable var shadowRadius: CGFloat = 0
    
    //checkbox button functionality
    @IBInspectable var checkboxButton: Bool = false
    @IBInspectable var uncheckedImage: UIImage = UIImage()
    @IBInspectable var checkedImage: UIImage = UIImage()
    
    //Image inside UIButton
    @IBInspectable var imageViewContentMode: Int = UIViewContentMode.scaleToFill.rawValue
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.customize()
        self.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    override func prepareForInterfaceBuilder() {
        customize()
    }
    
    func customize(){
        self.layer.borderColor = self.borderColor.cgColor
        self.layer.borderWidth = self.borderWidth
        self.layer.cornerRadius = self.cornerRadius
        self.layer.shadowColor = self.shadowColor.cgColor
        self.layer.shadowOpacity = self.shadowOpacity
        self.layer.shadowOffset = self.shadowOffset
        self.layer.shadowRadius = self.shadowRadius
        
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
    
    func tapped(sender: DTButton) {
        self.action?()
    }
}
