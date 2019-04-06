//
//  UserService.swift
//  EventyayOrganizer
//
//  Created by Dilum De Silva on 4/3/19.
//  Copyright © 2019 FOSSAsia. All rights reserved.
//

import Foundation
import ObjectMapper

class UserService {
    
    private init(){ }
    
    public static func checkEmailAvailability(_ email: String, completion: @escaping (EmailAvailabilityResponse) -> ()) {
        do {
            
            try APIClient.shared.post("/users/checkEmail", withParams: ["email": email], type: EmailAvailabilityResponse()) { (urlResponse, result, error) in
                switch urlResponse?.statusCode {
                    case 422, 200:
                        completion(result!)
                        break
                    default:
                        let emailAvailabilityResponseObj = EmailAvailabilityResponse(JSONString: "{\"error\":\"Oops.. Something went wrong at the server. Please try again!\"}")
                        completion(emailAvailabilityResponseObj!)
                        break
                }
            }
        } catch APIClientError.jsonSerializationError {
            let emailAvailabilityResponseObj = EmailAvailabilityResponse(JSONString: "{\"error\":\"Email validation request failed!\"}")
            completion(emailAvailabilityResponseObj!)
        } catch {
            let emailAvailabilityResponseObj = EmailAvailabilityResponse(JSONString: "{\"error\":\"Oops.. Something went wrong. Please try again!\"}")
            completion(emailAvailabilityResponseObj!)
        }
        
    }
    
    
    public static func signup(_ email: String, completion: @escaping () -> ()) {
        //TODO
    }
    
    
    public static func login(_ email: String, completion: @escaping () -> ()) {
        //TODO
    }
    
}
