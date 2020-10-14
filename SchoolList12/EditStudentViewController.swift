//
//  EditStudentViewController.swift
//  SchoolList12
//
//  Created by Thomas Bagrel on 14/10/2020.
//  Copyright © 2020 Telecom Nancy. All rights reserved.
//

import UIKit

class EditStudentViewController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var groupField: UITextField!
    
    var student: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFieldsFromStudent()
    }
    
    func updateFieldsFromStudent() {
        firstNameField.text! = student!.firstName
        lastNameField.text! = student!.lastName
        groupField.text! = student!.group
    }
    
    func updateStudentFromFields() {
        student!.firstName = firstNameField.text!
        student!.lastName = lastNameField.text!
        student!.group = groupField.text!
    }
}
