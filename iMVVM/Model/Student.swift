//
//  Student.swift
//  iMVVM
//
//  Created by Rohit Makwana on 03/07/19.
//  Copyright © 2019 Rohit Makwana. All rights reserved.
//

import Foundation

class Student {
    
    private var firstName: String?
    private var lastName: String?
    var email: String?
    
    var fullName : String? {
        
        get {
            return "\(self.firstName ?? "") \(self.lastName ?? "")"
        }
    }
    
    init(_ firstName: String, _ lastName: String, _ email: String) {
        
        self.firstName = firstName
        self.lastName  = lastName
        self.email     = email
    }
}
