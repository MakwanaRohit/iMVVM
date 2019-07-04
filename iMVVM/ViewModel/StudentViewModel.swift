//
//  StudentViewModel.swift
//  iMVVM
//
//  Created by Rohit Makwana on 03/07/19.
//  Copyright © 2019 Rohit Makwana. All rights reserved.
//

import Foundation

class StudentViewModel {
    
    //MARK:- Declared Variables
    var reloadStudentList = { () -> () in }
    var students: [Student]? = [] {
        
        didSet {
            self.reloadStudentList()
        }
    }
    
    //MARK:- Declared Functions
    func addStudent(WithFirstName firstName:String, lastName: String, email: String )  {
        
        self.students?.append(Student(firstName, lastName, email))
    }
}
