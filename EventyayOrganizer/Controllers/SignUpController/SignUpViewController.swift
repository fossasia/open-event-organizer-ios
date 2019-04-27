//
//  SignUpViewController.swift
//  EventyayOrganizer
//
//  Created by JOGENDRA on 30/11/18.
//  Copyright © 2018 FOSSAsia. All rights reserved.
//

import M13Checkbox
import Material
import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet var firstNameTextField: TextField!
    @IBOutlet var lastNameTextField: TextField!
    @IBOutlet var emailTextField: TextField!
    @IBOutlet var passwordTextField: TextField!
    @IBOutlet var addressTextField: TextField!
    @IBOutlet var personalServerButton: M13Checkbox!
    @IBOutlet var signUpButton: RaisedButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGesture()
        prepareFields()
        prepareToggleRadioButton()
        prepareSignUpButton()
    }
}
