//
//  LoginVCMethods.swift
//  EventyayOrganizer
//
//  Created by JOGENDRA on 29/11/18.
//  Copyright © 2018 FOSSAsia. All rights reserved.
//

import M13Checkbox
import UIKit

extension LoginViewController {
    func addTapGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    // Configures Email Text Field
    func prepareEmailField() {
        emailTextField.placeholderNormalColor = .iOSGray()
        emailTextField.placeholderActiveColor = .defaultColor()
        emailTextField.dividerNormalColor = .iOSGray()
        emailTextField.dividerActiveColor = .red
        emailTextField.textColor = .black
        emailTextField.clearIconButton?.tintColor = .iOSGray()
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }

    // Configures Password Text Field
    func preparePasswordField() {
        passwordTextField.placeholderNormalColor = .iOSGray()
        passwordTextField.placeholderActiveColor = .defaultColor()
        passwordTextField.dividerNormalColor = .iOSGray()
        passwordTextField.dividerActiveColor = .red
        passwordTextField.textColor = .black
        passwordTextField.clearIconButton?.tintColor = .iOSGray()
        passwordTextField.visibilityIconButton?.tintColor = .iOSGray()
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }

    // Configures Address Text Field
    func prepareAddressField() {
        addressTextField.placeholderNormalColor = .iOSGray()
        addressTextField.placeholderActiveColor = .defaultColor()
        addressTextField.dividerNormalColor = .iOSGray()
        addressTextField.dividerActiveColor = .defaultColor()
        addressTextField.textColor = .black
    }

    @IBAction func toggleRadioButtons(_ sender: M13Checkbox) {
        if sender.checkState == .checked {
            addressTextField.tag = 1
            addressTextField.isUserInteractionEnabled = false
            addressTextField.text = "https://open-event-api-dev.herokuapp.com/"
            addressTextField.placeholder = ""
        } else {
            addressTextField.tag = 0
            addressTextField.isUserInteractionEnabled = true
            addressTextField.text = ""
            addressTextField.placeholder = "Custom Server URL"
        }
    }

    // Validate fields
    func isValid() -> Bool {
        if let emailID = emailTextField.text, !emailID.isValidEmail() {
            return false
        }
        if let password = passwordTextField.text, password.isEmpty {
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
            if password.isEmpty || password.count < 6 || password.count > 64 {
                passwordTextField.dividerActiveColor = .red
            } else {
                passwordTextField.dividerActiveColor = .green
            }
        }
    }

    // force dismiss keyboard if open.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    // Toggle Editing
    func toggleEditing() {
        emailTextField.isEnabled = !emailTextField.isEnabled
        passwordTextField.isEnabled = !passwordTextField.isEnabled
    }

    // Clear field after login
    func clearFields() {
        passwordTextField.text = ""
    }
}
