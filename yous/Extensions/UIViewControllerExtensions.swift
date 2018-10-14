//
//  UIViewControllerExtensions.swift
//  yous
//
//  Created by Nikola Milic on 10/14/18.
//  Copyright © 2018 Nikola Milic. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // Dismiss keyboard on background tap
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
