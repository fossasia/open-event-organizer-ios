//
//  LoginViewController.swift
//  EventyayOrganizer
//
//  Created by JOGENDRA on 29/11/18.
//  Copyright © 2018 FOSSAsia. All rights reserved.
//

import M13Checkbox
import Material
import UIKit

class LoginViewController: UIViewController {
    // MARK: - Outlests

    @IBOutlet var emailTextField: TextField!
    @IBOutlet var passwordTextField: TextField!
    @IBOutlet var personalServerButton: M13Checkbox!
    @IBOutlet var loginButton: RaisedButton!
    @IBOutlet var signUpButton: FlatButton!
    @IBOutlet var forgotButton: FlatButton!
    @IBOutlet var addressTextField: TextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        addTapGesture()
        prepareEmailField()
        preparePasswordField()
        prepareAddressField()
    }
}
