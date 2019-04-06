//
//  EmailAvailabilityResponse.swift
//  EventyayOrganizer
//
//  Created by Dilum De Silva on 4/3/19.
//  Copyright © 2019 FOSSAsia. All rights reserved.
//

import Foundation
import ObjectMapper

class EmailAvailabilityResponse: Mappable {
    private var availability: String?
    var error: String?
    var isAvailable: Bool? {
        get {
            return availability?.toBool()
        }
    }
    init() {}
    
    required init?(map: Map) {
        availability <- map["result"]
        error <- map["error"]
    }
    
    func mapping(map: Map) {
        availability <- map["result"]
        error <- map["error"]
    }
    
}
