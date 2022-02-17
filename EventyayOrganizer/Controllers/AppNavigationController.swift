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
        guard let navigationBarView = navigationBar as? NavigationBar else {
            return
        }
        navigationBarView.depthPreset = .depth1
    }
}
