//
//  StudentsViewController.swift
//  iMVVM
//
//  Created by Rohit Makwana on 03/07/19.
//  Copyright © 2019 Rohit Makwana. All rights reserved.
//

import UIKit

let cellIdentifier = "StudentTableViewCell"

class StudentsViewController: UIViewController {
    
    //MARK:- IBOutlet
    @IBOutlet private weak var studentsTableView: UITableView!

    //MARK:- Declared Variables
    private var studentViewModel = StudentViewModel()
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Students"
        self.setupTableView()
        
        self.studentViewModel.reloadStudentList = { [weak self]() in
            
            self!.studentsTableView.reloadData()
        }
    }
    
    
    //MARK:- Segue method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddStudent" {
            
            if let controller = segue.destination as? AddStudentViewController {
                controller.studentAddDelegate = self
            }
        }
    }
    
    //MARK:- Public Methods
    private func setupTableView() {
        
        self.studentsTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.studentsTableView.delegate = self
        self.studentsTableView.dataSource = self
    }
}


//MARK:-
extension StudentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK:- UITableView Delegate & DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.studentViewModel.students?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : StudentTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! StudentTableViewCell
        
        cell.student = self.studentViewModel.students![indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
}


//MARK:-
extension StudentsViewController: StudentAddDelegate {
    
    //MARK:- StudentAddDelegate
    func AddStudentViewController(_ firstName: String, _ lastName: String, _ email: String) {
        
        self.studentViewModel.students?.append(Student(firstName, lastName, email))
    }
}
