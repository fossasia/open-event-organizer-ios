//
//  SignUpViewController.swift
//  EventyayOrganizer
//
//  Created by JOGENDRA on 30/11/18.
//  Copyright © 2018 FOSSAsia. All rights reserved.
//

import UIKit
import Material
import M13Checkbox

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: TextField!
    @IBOutlet weak var lastNameTextField: TextField!
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var addressTextField: TextField!
    @IBOutlet weak var personalServerButton: M13Checkbox!
    @IBOutlet weak var signUpButton: RaisedButton!
    @IBOutlet weak var backToLoginButton: FlatButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        addTapGesture()
        prepareFields()
        prepareSignUpButton()
    }

}
