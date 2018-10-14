//
//  SignupViewController.swift
//  yous
//
//  Created by Nikola Milic on 10/14/18.
//  Copyright © 2018 Nikola Milic. All rights reserved.
//

import UIKit
import SnapKit

class SignupViewController: UIViewController {
    
    let logoWidth: CGFloat = 50
    let sideMargin: CGFloat = 15

    let logoImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "logo"))
        return view
    }()
    
    let signupLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = UIFont(name: "EncodeSans-Medium", size: 20)
        return label
    }()
    
    let facebookButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Continue with Facebook", for: .normal)
        button.backgroundColor = UIColor(hexString: "0084FF")
        button.titleLabel?.font = UIFont(name: "EncodeSans-Medium", size: 15)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
    }()
    
    let googleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Continue with Google", for: .normal)
        button.backgroundColor = UIColor(hexString: "F4F4F4")
        button.titleLabel?.font = UIFont(name: "EncodeSans-Medium", size: 15)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
    }()
    
    let orSignupWithLabel: UILabel = {
        let label = UILabel()
        label.text = "Or SignUp With"
        label.font = UIFont(name: "EncodeSans-Medium", size: 20)
        return label
    }()
    
    let emailTextField: SideImageTextField = {
        let textField = SideImageTextField(placeholder: "Email address", left: .email, right: .none)
        return textField
    }()
    
    let passwordTextField: SideImageTextField = {
        let textField = SideImageTextField(placeholder: "Password", left: .password, right: .show)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let continueButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = UIColor(hexString: "FA497C")
        button.titleLabel?.font = UIFont(name: "EncodeSans-SemiBold", size: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        [logoImageView, signupLabel, facebookButton, googleButton,
         orSignupWithLabel, emailTextField, passwordTextField, continueButton].forEach {
            view.addSubview($0)
        }
        
        setupSnapKitConstraints()
        hideKeyboardWhenTappedAround()
    }

    func setupSnapKitConstraints(){
        let safeArea = self.view.safeAreaLayoutGuide
        
        logoImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.logoWidth)
            make.centerX.equalTo(safeArea)
            make.top.equalTo(100)
        }
        
        signupLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(safeArea)
        }
        
        facebookButton.snp.makeConstraints { (make) in
            make.top.equalTo(signupLabel.snp_bottomMargin).offset(30)
            make.leading.equalTo(safeArea).offset(sideMargin)
            make.trailing.equalTo(safeArea).inset(sideMargin)
            make.centerX.equalTo(safeArea)
            make.height.equalTo(58)
        }
        
        googleButton.snp.makeConstraints { (make) in
            make.top.equalTo(facebookButton.snp_bottomMargin).offset(18)
            make.leading.equalTo(safeArea).offset(sideMargin)
            make.trailing.equalTo(safeArea).inset(sideMargin)
            make.centerX.equalTo(safeArea)
            make.height.equalTo(58)
        }
        
        orSignupWithLabel.snp.makeConstraints { (make) in
            make.top.equalTo(googleButton.snp_bottomMargin).offset(30)
            make.centerX.equalTo(safeArea)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(orSignupWithLabel.snp_bottomMargin).offset(30)
            make.leading.equalTo(safeArea).offset(sideMargin)
            make.trailing.equalTo(safeArea).inset(sideMargin)
            make.centerX.equalTo(safeArea)
            make.height.equalTo(55)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp_bottomMargin).offset(20)
            make.leading.equalTo(safeArea).offset(sideMargin)
            make.trailing.equalTo(safeArea).inset(sideMargin)
            make.centerX.equalTo(safeArea)
            make.height.equalTo(55)
        }
        
        continueButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp_bottomMargin).offset(60)
            make.leading.equalTo(safeArea).offset(2*sideMargin)
            make.trailing.equalTo(safeArea).inset(2*sideMargin)
            make.centerX.equalTo(safeArea)
            make.height.equalTo(60)
        }
        
    }

}
