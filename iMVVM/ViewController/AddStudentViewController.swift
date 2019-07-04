//
//  AddStudentViewController.swift
//  iMVVM
//
//  Created by Rohit Makwana on 03/07/19.
//  Copyright © 2019 Rohit Makwana. All rights reserved.
//

import UIKit

protocol StudentAddDelegate {
    
    func AddStudentViewController(_ firstName: String, _ lastName: String, _ email: String)
}

class AddStudentViewController: UIViewController {
    
    //MARK:- IBOutlet
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var addButton: UIButton!

    //MARK:- Declared Variables
    private var studentViewModel = StudentViewModel()
    var studentAddDelegate : StudentAddDelegate?
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add Student"
        self.setupTextFieldProperty()
    }
    
    //MARK:- IBActions
    @IBAction func addButtonAction(_ sender: Any) {
        
        self.view.endEditing(true)
        
        if self.firstNameTextField.text!.count == 0 {
            self.showAlertWithMessage("Please enter firstname")
        }
        else if self.firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {
            self.showAlertWithMessage("Please enter valid firstname")
        }
        else if self.lastNameTextField.text!.count == 0 {
            self.showAlertWithMessage("Please enter lastname")
        }
        else if self.lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {
            self.showAlertWithMessage("Please enter valid lastname")
        }
        else if self.emailTextField.text!.count == 0 {
            self.showAlertWithMessage("Please enter email")
        }
        else if !self.isValidEmail(self.emailTextField.text!) {
            self.showAlertWithMessage("Please enter valid email")
        }
        else{
            self.navigationController?.popViewController(animated: true)
            self.studentAddDelegate?.AddStudentViewController(self.firstNameTextField.text!, self.lastNameTextField.text!, self.emailTextField.text!)
        }
    }
    
    //MARK:- Public Methods
    private func setupTextFieldProperty() {
        
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate  = self
        self.emailTextField.delegate     = self
        
        self.firstNameTextField.keyboardType = .default
        self.lastNameTextField.keyboardType  = .default
        self.emailTextField.keyboardType     = .emailAddress
        
        self.firstNameTextField.returnKeyType = .next
        self.lastNameTextField.returnKeyType  = .next
        self.emailTextField.returnKeyType     = .done
    }
    
    private func showAlertWithMessage(_ message: String) {
    
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func isValidEmail(_ email:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }

}

//MARK:-
extension AddStudentViewController : UITextFieldDelegate {

    //MARK:- UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.firstNameTextField {
            self.lastNameTextField.becomeFirstResponder()
        }
        else if textField == lastNameTextField {
            self.emailTextField.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true
    }
}
