//
//  StudentModel.swift
//  SchoolList12
//
//  Created by Thomas Bagrel on 14/10/2020.
//  Copyright © 2020 Telecom Nancy. All rights reserved.
//

import UIKit

class StudentModel {
    var students = [
        Student(firstName: "Thomas", lastName: "BAGREL", group: "3AA")
    ]
    
    func addStudent(firstName: String, lastName: String, group: String) {
        students.append(Student(firstName: firstName, lastName: lastName, group: group))
    }
    
    func getStudentAtIndex(i: Int) -> Student {
        return students[i]
    }
    
    func getStudentCount() -> Int {
        return students.count
    }
}

class Student: NSObject, NSCopying {
    var firstName: String
    var lastName: String
    var group: String
    
    init(firstName: String, lastName: String, group: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.group = group
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Student(firstName: firstName, lastName: lastName, group: group)
        return copy
    }
    
    func setFrom(other: Student) {
        self.firstName = other.firstName
        self.lastName = other.lastName
        self.group = other.group
    }
}

