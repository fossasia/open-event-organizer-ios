//
//  SignUpVCMethods.swift
//  EventyayOrganizer
//
//  Created by JOGENDRA on 30/11/18.
//  Copyright © 2018 FOSSAsia. All rights reserved.
//

import UIKit
import M13Checkbox

extension SignUpViewController {

    func addTapGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    func prepareFields() {
        firstNameTextField.placeholderNormalColor = .iOSGray()
        firstNameTextField.placeholderActiveColor = .defaultColor()
        firstNameTextField.dividerNormalColor = .iOSGray()
        firstNameTextField.dividerActiveColor = .defaultColor()
        firstNameTextField.textColor = .black
        firstNameTextField.clearIconButton?.tintColor = .iOSGray()
        firstNameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)

        lastNameTextField.placeholderNormalColor = .iOSGray()
        lastNameTextField.placeholderActiveColor = .defaultColor()
        lastNameTextField.dividerNormalColor = .iOSGray()
        lastNameTextField.dividerActiveColor = .defaultColor()
        lastNameTextField.textColor = .black
        lastNameTextField.clearIconButton?.tintColor = .iOSGray()
        lastNameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)

        emailTextField.placeholderNormalColor = .iOSGray()
        emailTextField.placeholderActiveColor = .defaultColor()
        emailTextField.dividerNormalColor = .iOSGray()
        emailTextField.dividerActiveColor = .defaultColor()
        emailTextField.textColor = .black
        emailTextField.clearIconButton?.tintColor = .iOSGray()
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)

        passwordTextField.placeholderNormalColor = .iOSGray()
        passwordTextField.placeholderActiveColor = .defaultColor()
        passwordTextField.dividerNormalColor = .iOSGray()
        passwordTextField.dividerActiveColor = .defaultColor()
        passwordTextField.textColor = .black
        passwordTextField.visibilityIconButton?.tintColor = .iOSGray()
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)

        addressTextField.placeholderNormalColor = .iOSGray()
        addressTextField.placeholderActiveColor = .defaultColor()
        addressTextField.dividerNormalColor = .iOSGray()
        addressTextField.dividerActiveColor = .defaultColor()
        addressTextField.text = "https://api.eventyay.com/v1/"
        addressTextField.textColor = .black
    }
    
    func prepareToggleRadioButton(){
        personalServerButton.checkState = .checked
    }

    @IBAction func toggleRadioButtons(_ sender: M13Checkbox) {
        if sender.checkState == .checked {
            addressTextField.tag = 1
            addressTextField.isUserInteractionEnabled = false
            addressTextField.text = "https://api.eventyay.com/v1/"
            addressTextField.placeholder = ""
        } else {
            addressTextField.tag = 0
            addressTextField.isUserInteractionEnabled = true
            addressTextField.text = ""
            addressTextField.placeholder = "Custom Server URL"
        }
    }

    @IBAction func goBackToLoginScreen() {
        self.dismiss(animated: true, completion: nil)
    }

    func prepareSignUpButton() {
        signUpButton.addTarget(self, action: #selector(performSignUp), for: .touchUpInside)
    }

    // Sign Up User
    @objc func performSignUp() {

    }

    // function called on return button click of keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        if textField == passwordTextField {
            performSignUp()
        }
        return false
    }

    // dismiss keyboard if open.
    func dismissKeyboard() {
        // Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    // Validate fields
    func isValid() -> Bool {
        if let emailID = emailTextField.text, !emailID.isValidEmail() {
            return false
        }
        if let password = passwordTextField.text, password.isEmpty, password.isTextSufficientComplexity {
            return false
        }
        if personalServerButton.checkState == .checked {
            if let address = addressTextField.text, address.isEmpty {
                return false
            }
        }
        return true
    }

    @objc func textFieldDidChange(textField: UITextField) {
        if textField == emailTextField, let emailID = emailTextField.text {
            if !emailID.isValidEmail() {
                emailTextField.dividerActiveColor = .red
            } else {
                emailTextField.dividerActiveColor = .green
            }
        } else if textField == passwordTextField, let password = passwordTextField.text {
            if password.isEmpty || password.count < 5 {
                passwordTextField.dividerActiveColor = .red
            } else {
                passwordTextField.dividerActiveColor = .green
            }
        }
    }
    
}
