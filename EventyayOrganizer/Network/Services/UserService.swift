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
    static let serverError = "{\"error\":\"Oops.. Something went wrong at the server. Please try again!\"}"
    static let emailValidationError = "{\"error\":\"Email validation request failed!\"}"
    static let genericError = "{\"error\":\"Oops.. Something went wrong. Please try again!\"}"
    private init() {}

    public static func checkEmailAvailability(_ email: String,
                                              completion: @escaping (EmailAvailabilityResponse) -> Void) {
        do {
            try APIClient.shared.post(ControllerConstants.CommonURL.checkEmail,
                                      withParams: ["email": email],
                                      type: EmailAvailabilityResponse()) { urlResponse, result, _ in
                switch urlResponse?.statusCode {
                case 422, 200:
                    completion(result!)
                default:
                    let emailAvailabilityResponseObj = EmailAvailabilityResponse(JSONString: serverError)
                    completion(emailAvailabilityResponseObj!)
                }
            }
        } catch APIClientError.jsonSerializationError {
            let emailAvailabilityResponseObj = EmailAvailabilityResponse(JSONString: emailValidationError)
            completion(emailAvailabilityResponseObj!)
        } catch {
            let emailAvailabilityResponseObj = EmailAvailabilityResponse(JSONString: genericError)
            completion(emailAvailabilityResponseObj!)
        }
    }

    public static func signup(_ email: String, completion: @escaping () -> Void) {}
    public static func login(_ email: String, completion: @escaping () -> Void) {}
}
