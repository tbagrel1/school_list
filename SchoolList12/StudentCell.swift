//
//  StudentCell.swift
//  SchoolList12
//
//  Created by Thomas Bagrel on 14/10/2020.
//  Copyright © 2020 Telecom Nancy. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {
    func setFromStudent(student: Student) {
        firstNameLabel.text! = student.firstName
        lastNameLabel.text! = student.lastName
        groupLabel.text! = "(\(student.group))"
    }
    
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
}
