//
//  WelcomeVCMethods.swift
//  EventyayOrganizer
//
//  Created by Dilum De Silva on 3/29/19.
//  Copyright © 2019 FOSSAsia. All rights reserved.
//

import Alamofire
import M13Checkbox
import Material
import NVActivityIndicatorView
import UIKit

extension WelcomeViewController {
    func addTapGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    // Config Indicator
    func prepareIndicatorView() {
        indicatorView = NVActivityIndicatorView(frame: CGRect(center: CGPoint(x: self.view.frame.width / 2,
                                                                              y: self.view.frame.height / 2),
                                                              size: CGSize(width: 50,
                                                                           height: 50)))
        indicatorView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.6)
        view.addSubview(indicatorView)
    }
    // Config Email Field
    func prepareEmailField() {
        emailTextField.placeholderNormalColor = .iOSGray()
        emailTextField.placeholderActiveColor = .defaultColor()
        emailTextField.placeholder = ControllerConstants.Placeholders.emailAddress
        emailTextField.dividerNormalColor = .iOSGray()
        emailTextField.dividerActiveColor = .red
        emailTextField.textColor = .black
        emailTextField.clearIconButton?.tintColor = .iOSGray()
        emailTextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
    }
    func prepareToggleRadioButton() {
        personalServerButton.checkState = .checked
    }
    // Config Custom URL Text Field
    func prepareCustomURLField() {
        addressTextField.placeholderNormalColor = .iOSGray()
        addressTextField.placeholderActiveColor = .defaultColor()
        addressTextField.dividerNormalColor = .iOSGray()
        addressTextField.dividerActiveColor = .defaultColor()
        addressTextField.text = ControllerConstants.CommonURL.Debug.baseURL
        addressTextField.textColor = .black
    }
    @IBAction func personalServerToggleClicked(_ sender: M13Checkbox) {
        if sender.checkState == .checked {
            addressTextField.tag = 1
            addressTextField.isUserInteractionEnabled = false
            addressTextField.text = ControllerConstants.CommonURL.Debug.baseURL
            addressTextField.placeholder = ""
        } else {
            addressTextField.tag = 0
            addressTextField.isUserInteractionEnabled = true
            addressTextField.text = ""
            addressTextField.placeholder = ControllerConstants.Placeholders.customServerURL
            APIClient.shared.kBaseURL = addressTextField.text!
            print("Custom URL has been called")
        }
    }
    @IBAction func onGetStartedClicked(_ sender: Any) {
        indicatorView.startAnimating()
        UserService.checkEmailAvailability(emailTextField.text!) { [unowned self] response in
            self.indicatorView.stopAnimating()
            if response.error ?? nil != nil {
                print("error: \(String(describing: response.error))")
            } else {
                print("\(String(describing: response.isAvailable))")
                self.screenNavigation(response: response.isAvailable!)
                //true - signup identifier: SignUpController
                // false - login identifier: LoginController
            }
        }
    }
    func screenNavigation(response: Bool) {
        if response == true {
            let signupVC = (self.storyboard?.instantiateViewController(withIdentifier:
                "SignUpController"))!
            self.navigationController?.pushViewController(signupVC, animated: true)
        } else if response == false {
//            let loginVC = self.storyboard?.instantiateViewController(withIdentifier:
//                "LoginController") as! LoginViewController
            let loginVC = (self.storyboard?.instantiateViewController(withIdentifier:
                "LoginController"))!
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
    }
    // Validate fields
    func isValid() -> Bool {
        if let emailID = emailTextField.text, !emailID.isValidEmail() {
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
        }
    }
    // Force dismiss keyboard if open.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    // Toggle Editing
    func toggleEditing() {
        emailTextField.isEnabled = !emailTextField.isEnabled
    }
}
