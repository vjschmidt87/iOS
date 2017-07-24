//
//  UserDefaultsManager.swift
//  CoreData
//
//  Created by retina on 11/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    
    private static let usernameToken = "usernameToken"
    private static let emailToken = "emailToken"
    
    static var username: String {
        get {
            return UserDefaults.standard.string(forKey: self.usernameToken)!
        }
        set {
            UserDefaults.standard.set(newValue, forKey: self.usernameToken)
        }
    }
    
    static var email: String {
        get {
            return UserDefaults.standard.string(forKey: self.emailToken)!
        }
        set {
            UserDefaults.standard.set(newValue, forKey: self.emailToken)
        }
    }
    
}
