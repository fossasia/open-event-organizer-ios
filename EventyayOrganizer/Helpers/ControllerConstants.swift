//
//  ControllerConstants.swift
//  EventyayOrganizer
//
//  Created by Dilum De Silva on 4/12/19.
//  Copyright © 2019 FOSSAsia. All rights reserved.
//

import UIKit

class ControllerConstants{
    
    struct Placeholders {
        static let emailAddress = "Email Address"
        static let password = "Password"
        static let confirmPassword = "Confirm Password"
        static let customServerURL = "Custom Server URL"
    }
    
    struct CheckEmailAvailability {
        
    }
    
    struct Login {
        static let login = "Login"
    }
    
    struct SignUp {
        static let signUp = "Sign Up"
        static let successSignup = "You successfully signed-up! An email with a verification link was sent to your address."
    }
    
    struct Logout {
        static let logout = "Logout"
    }
    
    struct CommonURL {
        static let checkEmail = "/users/checkEmail"
        static let signUpUser = "users"
        static let loginUser = "../auth/session"
        static let changePassword = "auth/change-password"
        static let resetPassword = "auth/reset-password"
        static let sendVerificationEmail = "auth/resend-verification-email"
        
        struct Debug {
            static let baseURL = "https://open-event-api-dev.herokuapp.com/v1"
        }
        struct Release {
            static let baseURL = "https://api.eventyay.com/v1/"
        }
    }
    
    struct Errors {
        static let invalidEmail = "Error, incorrect email"
        static let passwordLengthError = "Error, Should be at least 8 characters"
        static let passwordErrorSignUp = "Password should be 6 characters long with one uppercase, lowercase and a number"
        static let passwordDoNotMatch = "Passwords do not match"
        
        struct APIRequestErrors {
            static let URLConcatenation = "Error, URL concatenation"
        }
    }
    
    struct TestKeys {
        struct TestAccount {
            static let emailId = "orgadeveloper@gmail.com"
            static let password = "fossasia"
            static let incorrectPassword = "fossasiatest"
            static let invalidEmail = "orga@gmail.com"
        }
    }
}

