//
//  WelcomViewController.swift
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

class WelcomeViewController: UIViewController {
    var indicatorView: NVActivityIndicatorView!
    @IBOutlet var personalServerButton: M13Checkbox!
    @IBOutlet var addressTextField: TextField!
    @IBOutlet var emailTextField: TextField!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGesture()
        prepareEmailField()
        prepareCustomURLField()
        prepareToggleRadioButton()
        prepareIndicatorView()
    }
}
