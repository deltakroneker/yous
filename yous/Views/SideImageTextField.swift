//
//  SideImageTextField.swift
//  yous
//
//  Created by Nikola Milic on 10/14/18.
//  Copyright © 2018 Nikola Milic. All rights reserved.
//

import UIKit
import SnapKit

enum TextFieldLeftImage {
    case none
    case username
    case password
    case phone
    case email
}

enum TextFieldRightImage {
    case none
    case show
}

class SideImageTextField: UITextField {
    
    let displacement: CGFloat = 20
    let iconWidth: CGFloat = 20
    let fontSize: CGFloat = 16

    init(placeholder: String, left: TextFieldLeftImage, right: TextFieldRightImage) {
        super.init(frame: .zero)
        setupView(name: placeholder, imageLeft: left, imageRight: right)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(name: String, imageLeft: TextFieldLeftImage, imageRight: TextFieldRightImage) {
        
        attributedPlaceholder = NSAttributedString(string: name,
                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        font = UIFont(name: "EncodeSans-Medium", size: fontSize)
        backgroundColor = UIColor.white
        borderStyle = .roundedRect
        keyboardType = .default
        clearButtonMode = .whileEditing
        leftViewMode = .always
        rightViewMode = .always
        
        switch(imageLeft) {
        case .username:
            leftView = UIImageView(frame: CGRect(x: 0, y: 0, width: iconWidth, height: iconWidth))
            if let lv = leftView as? UIImageView {
                lv.image = UIImage(named: "username")
                lv.contentMode = .scaleAspectFit
            }
        case.password:
            leftView = UIImageView(frame: CGRect(x: 0, y: 0, width: iconWidth, height: iconWidth))
            if let lv = leftView as? UIImageView {
                lv.image = UIImage(named: "password")
                lv.contentMode = .scaleAspectFit
            }
        case .phone:
            leftView = UIImageView(frame: CGRect(x: 0, y: 0, width: iconWidth, height: iconWidth))
            if let lv = leftView as? UIImageView {
                lv.image = UIImage(named: "phone")
                lv.contentMode = .scaleAspectFit
            }
        case .email:
            leftView = UIImageView(frame: CGRect(x: 0, y: 0, width: iconWidth, height: iconWidth))
            if let lv = leftView as? UIImageView {
                lv.image = UIImage(named: "email")
                lv.contentMode = .scaleAspectFit
            }
        case .none:
            leftViewMode = .never
        }
        
        switch(imageRight) {
            
        case .show:
            rightView = UIImageView(frame: CGRect(x: 0, y: 0, width: iconWidth, height: iconWidth))
            if let rv = rightView as? UIImageView {
                rv.image = UIImage(named: "show")
                rv.contentMode = .scaleAspectFit
            }
        case .none:
            rightViewMode = .never
        }
        
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += displacement
        return textRect
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= displacement
        return textRect
    }
    
}
