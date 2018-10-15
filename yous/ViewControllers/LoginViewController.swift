//
//  LoginViewController.swift
//  yous
//
//  Created by Nikola Milic on 10/14/18.
//  Copyright © 2018 Nikola Milic. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {   // NOT YET FINISHED
    
    let logoImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "logo"))
        return view
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "WELCOME!"
        label.font = UIFont(name: "EncodeSans-Regular", size: 40)
        return label
    }()
    
    let pleaseSignInLabel: UILabel = {
        let label = UILabel()
        label.text = "Please sign in to your account to continue with YOUS!"
        label.font = UIFont(name: "EncodeSans-Regular", size: 18)
        label.textColor = UIColor.gray
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let usernameTextField: SideImageTextField = {
        let textField = SideImageTextField(placeholder: "Username", left: .username, right: .none )
        return textField
    }()
    
    let passwordTextField: SideImageTextField = {
        let textField = SideImageTextField(placeholder: "Password", left: .password, right: .show)
        return textField
    }()
    
    let phoneTextField: SideImageTextField = {
        let textField = SideImageTextField(placeholder: "Phone No.", left: .phone, right: .none)
        return textField
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        [logoImageView, welcomeLabel, pleaseSignInLabel,
         usernameTextField, passwordTextField, phoneTextField].forEach {
            view.addSubview($0)
        }
        
        setupSnapKitConstraints()
    }
    
    func setupSnapKitConstraints(){
        let safeArea = self.view.safeAreaLayoutGuide
        
        logoImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.equalTo(safeArea)
            make.top.equalTo(100)
        }
        
        welcomeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp_bottomMargin).offset(30)
            make.centerX.equalTo(safeArea)
        }
        
        pleaseSignInLabel.snp.makeConstraints { (make) in
            make.top.equalTo(welcomeLabel.snp_bottomMargin).offset(30)
            make.centerX.equalTo(safeArea)
            make.leading.equalTo(safeArea).offset(50)
            make.trailing.equalTo(safeArea).inset(50)
        }
        
        usernameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(pleaseSignInLabel.snp_bottomMargin).offset(30)
            make.leading.equalTo(safeArea).offset(16)
            make.trailing.equalTo(safeArea).inset(16)
            make.height.equalTo(55)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(usernameTextField.snp_bottomMargin).offset(30)
            make.leading.equalTo(safeArea).offset(16)
            make.trailing.equalTo(safeArea).inset(16)
            make.height.equalTo(55)
        }
        
        phoneTextField.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp_bottomMargin).offset(30)
            make.leading.equalTo(safeArea).offset(16)
            make.trailing.equalTo(safeArea).inset(16)
            make.height.equalTo(55)
        }
        
        
    }

}
