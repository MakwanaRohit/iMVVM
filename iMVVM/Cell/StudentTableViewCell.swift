//
//  StudentTableViewCell.swift
//  iMVVM
//
//  Created by Rohit Makwana on 03/07/19.
//  Copyright © 2019 Rohit Makwana. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    //MARK:- IBOutlet
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    //MARK:- Declared Variables
    var student: Student? = nil {
        
        didSet {
            setStudentData()
        }
    }
    
    //MARK:- awake From Nib
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK:- Set Student Data
    func setStudentData() {
        
        self.fullNameLabel.text = self.student?.fullName ?? ""
        self.emailLabel.text = self.student?.email ?? ""
    }    
}
