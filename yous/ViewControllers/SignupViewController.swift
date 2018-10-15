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
    
    let scrollView: UIScrollView = {
        let view  = UIScrollView()
        view.delaysContentTouches = false
        return view
    }()

    let logoImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "logo"))
        return view
    }()
    
    let signupLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = UIFont(name: "EncodeSans-Regular", size: 20)
        return label
    }()
    
    lazy var arrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "arrow_left"), for: .normal)
        button.tintColor = UIColor.black
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(arrowButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var facebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue with Facebook", for: .normal)
        button.backgroundColor = UIColor(hexString: "0084FF")
        button.setImage(UIImage(named: "facebook")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.snp.makeConstraints({ (make) in
            make.height.width.equalTo(25)
            make.leading.equalTo(button.snp_leadingMargin).offset(30)
            make.centerY.equalTo(button.snp.centerY)
        })
        button.titleLabel?.font = UIFont(name: "EncodeSans-Regular", size: 15)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(button.snp.centerX)
            make.centerY.equalTo(button.snp.centerY)
        })
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(continueWithFacebookButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var googleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue with Google", for: .normal)
        button.backgroundColor = UIColor(hexString: "F4F4F4")
        button.setImage(UIImage(named: "google")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.snp.makeConstraints({ (make) in
            make.height.width.equalTo(25)
            make.leading.equalTo(button.snp_leadingMargin).offset(30)
            make.centerY.equalTo(button.snp.centerY)
        })
        button.titleLabel?.font = UIFont(name: "EncodeSans-Regular", size: 15)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(button.snp.centerX)
            make.centerY.equalTo(button.snp.centerY)
        })
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(continueWithGoogleButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let orSignupWithLabel: UILabel = {
        let label = UILabel()
        label.text = "Or SignUp With"
        label.font = UIFont(name: "EncodeSans-Regular", size: 20)
        return label
    }()
    
    lazy var emailTextField: SideImageTextField = {
        let textField = SideImageTextField(placeholder: "Email address", left: .email, right: .none)
        textField.delegate = self
        return textField
    }()
    
    lazy var passwordTextField: SideImageTextField = {
        let textField = SideImageTextField(placeholder: "Password", left: .password, right: .show)
        textField.touched = eyeTouched
        textField.isSecureTextEntry = true
        textField.delegate = self
        return textField
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = UIColor(hexString: "FA497C")
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 20.0)
        button.layer.shadowOpacity = 0.20
        button.layer.shadowRadius = 25
        button.titleLabel?.font = UIFont(name: "EncodeSans-Regular", size: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        
        view.addSubview(scrollView)
        
        [logoImageView, signupLabel, arrowButton, facebookButton, googleButton,
         orSignupWithLabel, emailTextField, passwordTextField, continueButton].forEach {
            scrollView.addSubview($0)
        }
        
        setupSnapKitConstraints()
        setupKeyboard()
    }
    
    // MARK: Keyboard hiding
    
    func setupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        hideKeyboardWhenTappedAround()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo, let frame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        scrollView.transform = CGAffineTransform(translationX: 0, y: -frame.height)
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        scrollView.transform = CGAffineTransform(translationX: 0, y: 0)
    }
    
    // MARK: Buttons pressed
    
    func eyeTouched(){
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @objc func arrowButtonPressed() {
        
    }
    
    @objc func continueWithFacebookButtonPressed() {
        
    }
    
    @objc func continueWithGoogleButtonPressed() {
        
    }
    
    @objc func continueButtonPressed() {
        let rpvc = ResetPasswordViewController()
        self.present(rpvc, animated: true, completion: nil)
    }
    
    // MARK: SnapKit

    func setupSnapKitConstraints(){
        let outerSafeArea = self.view.safeAreaLayoutGuide
        let safeArea = scrollView.safeAreaLayoutGuide
        
        scrollView.snp.makeConstraints { (make) in
            make.width.height.equalTo(outerSafeArea)
            make.centerX.centerY.equalTo(outerSafeArea)
        }
        
        logoImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.logoWidth)
            make.centerX.equalTo(safeArea)
            make.top.equalTo(20)
        }
        
        signupLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(safeArea)
        }
        
        arrowButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(signupLabel.snp.centerY)
            make.leading.equalTo(safeArea).offset(sideMargin)
            make.height.width.equalTo(30)
        }
        
        facebookButton.snp.makeConstraints { (make) in
            make.top.equalTo(signupLabel.snp_bottomMargin).offset(40)
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
            make.top.equalTo(passwordTextField.snp_bottomMargin).offset(40)
            make.leading.equalTo(safeArea).offset(2*sideMargin)
            make.trailing.equalTo(safeArea).inset(2*sideMargin)
            make.centerX.equalTo(safeArea)
            make.height.equalTo(60)
        }
        
    }

}

extension SignupViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
