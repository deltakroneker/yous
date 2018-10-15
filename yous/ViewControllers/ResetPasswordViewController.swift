//
//  ResetPasswordViewController.swift
//  yous
//
//  Created by Nikola Milic on 10/15/18.
//  Copyright © 2018 Nikola Milic. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
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
    
    let resetPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Reset Password"
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
    
    let pleaseEnterLabel: UILabel = {
        let label = UILabel()
        label.text = "Please Enter your email address and we'll send you a link to reset your password."
        label.font = UIFont(name: "EncodeSans-Regular", size: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailTextField: SideImageTextField = {
        let textField = SideImageTextField(placeholder: "Enter Email Address", left: .email, right: .none)
        textField.delegate = self
        return textField
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = UIColor(hexString: "FA497C")
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 20.0)
        button.layer.shadowOpacity = 0.20
        button.layer.shadowRadius = 25
        button.titleLabel?.font = UIFont(name: "EncodeSans-Regular", size: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let backToLabel: UILabel = {
        let label = UILabel()
        label.text = "Back to"
        label.font = UIFont(name: "EncodeSans-Regular", size: 20)
        label.contentMode = .center
        return label
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.titleLabel?.font = UIFont(name: "EncodeSans-Regular", size: 20)
        button.setTitleColor(UIColor(hexString: "FA497C"), for: .normal)
        button.setTitle(" Sign In", for: .normal)
        button.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        
        view.addSubview(scrollView)
        
        [logoImageView, resetPasswordLabel, arrowButton, pleaseEnterLabel, emailTextField,
         submitButton, backToLabel, signInButton].forEach {
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
    
    @objc func arrowButtonPressed() {
        
    }
    
    @objc func submitButtonPressed() {
        let csvc = ComingSoonViewController()
        self.present(csvc, animated: true, completion: nil)
    }

    @objc func signInButtonPressed() {
        
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
        
        resetPasswordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(safeArea)
        }
        
        arrowButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(resetPasswordLabel.snp.centerY)
            make.leading.equalTo(safeArea).offset(sideMargin)
            make.height.width.equalTo(30)
        }
        
        pleaseEnterLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(safeArea).offset(sideMargin)
            make.trailing.equalTo(safeArea).inset(sideMargin)
            make.top.equalTo(resetPasswordLabel.snp_bottomMargin).offset(120)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(pleaseEnterLabel.snp_bottomMargin).offset(50)
            make.leading.equalTo(safeArea).offset(sideMargin)
            make.trailing.equalTo(safeArea).inset(sideMargin)
            make.centerX.equalTo(safeArea)
            make.height.equalTo(55)
        }
        
        submitButton.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp_bottomMargin).offset(40)
            make.leading.equalTo(safeArea).offset(2*sideMargin)
            make.trailing.equalTo(safeArea).inset(2*sideMargin)
            make.centerX.equalTo(safeArea)
            make.height.equalTo(60)
        }
        
        backToLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(signInButton.titleLabel?.snp.centerY ?? 0)
            make.trailing.equalTo(safeArea.snp.centerX)
        }
        
        signInButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(safeArea).inset(30)
            make.leading.equalTo(safeArea.snp.centerX)
        }
        
        
    }
}

extension ResetPasswordViewController: UITextFieldDelegate {
    
    
}
