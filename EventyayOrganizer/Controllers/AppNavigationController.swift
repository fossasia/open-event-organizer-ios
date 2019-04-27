//
//  ViewController.swift
//  Eventyay Organizer
//
//  Created by JOGENDRA on 25/11/18.
//  Copyright © 2018 FOSSAsia. All rights reserved.
//

import Material
import UIKit

class AppNavigationController: NavigationController {
    // Configures Navigation Controller
    open override func prepare() {
        super.prepare()
        guard let navBarView = navigationBar as? NavigationBar else {
            return
        }
        navBarView.depthPreset = .depth1
    }
}
