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

    
    @IBOutlet weak var personalServerToggle: M13Checkbox!
    @IBOutlet weak var customURLField: TextField!
    @IBOutlet weak var lblPersonalServerAddress: UILabel!
    
    @IBOutlet weak var emailTextField: TextField!
    
    @IBAction func personalServerToggleClicked(_ sender: M13Checkbox) {
        
        if self.personalServerToggle.checkState == .checked {
            self.customURLField.isHidden = true
            self.lblPersonalServerAddress.textColor = UIColor.black
            
        }else{
            self.customURLField.isHidden = false
            self.lblPersonalServerAddress.textColor = UIColor.gray
        }
        
    }
    
    private var indicatorView: NVActivityIndicatorView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.personalServerToggle.checkState = .checked
        self.customURLField.isHidden = true
        self.lblPersonalServerAddress.textColor = UIColor.black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        indicatorView = NVActivityIndicatorView(frame: CGRect(center: CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2), size: CGSize(width: 50, height: 50)))
        indicatorView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.6)
        view.addSubview(indicatorView)
    }
    
    @IBAction func onGetStartedClicked(_ sender: Any) {
        
        indicatorView.startAnimating()
        
        if  personalServerToggle.checkState != .checked && !customURLField.text!.isEmpty {
            APIClient.shared.kBaseURL =  customURLField.text!
            print("Custom server address has been requested")
        }else{
            print("Default server Address: \(String(describing: APIClient.shared.kBaseURL))")
        }
        
        
        
        UserService.checkEmailAvailability("orgadeveloper@gmail.com") { [unowned self] response in
            self.indicatorView.stopAnimating()
            //TODO - any logic to move to next screen or show error message
            if(response.error ?? nil != nil) {
                print("error: \(String(describing: response.error))")
            }else {
                print("\(String(describing: response.isAvailable))")
                
                //true - signup
                //false - login
            }
        }
        
    }
    
}
