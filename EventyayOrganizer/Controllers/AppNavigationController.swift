//
//  ViewController.swift
//  Eventyay Organizer
//
//  Created by JOGENDRA on 25/11/18.
//  Copyright © 2018 FOSSAsia. All rights reserved.
//

import UIKit
import Material

class AppNavigationController: NavigationController {

    // Configures Navigation Controller
    open override func prepare() {
        super.prepare()
        guard let v = navigationBar as? NavigationBar else {
            return
        }
        v.depthPreset = .depth1
    }

}

