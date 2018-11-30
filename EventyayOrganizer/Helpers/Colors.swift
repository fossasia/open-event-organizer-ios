//
//  Colors.swift
//  EventyayOrganizer
//
//  Created by JOGENDRA on 29/11/18.
//  Copyright © 2018 FOSSAsia. All rights reserved.
//

import UIKit

extension UIColor {

    class func defaultColor() -> UIColor {
        return UIColor.hexStringToUIColor(hex: "#2996F3")
    }

    class func iOSBlue() -> UIColor {
        return UIColor.hexStringToUIColor(hex: "#4285f4")
    }

    class func iOSOrange() -> UIColor {
        return UIColor.hexStringToUIColor(hex: "#FF8D00")
    }

    class func iOSTealBlue() -> UIColor {
        return UIColor.hexStringToUIColor(hex: "#31C9FE")
    }

    class func iOSGreen() -> UIColor {
        return UIColor.hexStringToUIColor(hex: "#00E664")
    }

    class func iOSYellow() -> UIColor {
        return UIColor.hexStringToUIColor(hex: "#FFCF00")
    }

    class func iOSRed() -> UIColor {
        return UIColor.hexStringToUIColor(hex: "#FF0000")
    }

    class func iOSGray() -> UIColor {
        return UIColor.hexStringToUIColor(hex: "#5F6368")
    }

}
