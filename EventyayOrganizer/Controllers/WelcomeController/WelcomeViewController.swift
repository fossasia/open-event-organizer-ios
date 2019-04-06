//
//  WelcomViewController.swift
//  EventyayOrganizer
//
//  Created by Dilum De Silva on 3/29/19.
//  Copyright © 2019 FOSSAsia. All rights reserved.
//

import UIKit
import Alamofire
import Material
import M13Checkbox
import NVActivityIndicatorView


class WelcomeViewController: UIViewController {
    
    var indicatorView: NVActivityIndicatorView!
    
    @IBOutlet weak var personalServerButton: M13Checkbox!
    @IBOutlet weak var addressTextField: TextField!
    @IBOutlet weak var emailTextField: TextField!
    
    
    
    
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
