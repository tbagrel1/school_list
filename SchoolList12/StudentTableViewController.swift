//
//  StudentTableViewController.swift
//  SchoolList12
//
//  Created by Thomas Bagrel on 14/10/2020.
//  Copyright © 2020 Telecom Nancy. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {
    
    var studentModel: StudentModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentModel = (UIApplication.shared.delegate as! AppDelegate).studentModel
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = studentModel?.getStudentCount()
        return count!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell")!
        let studentCell = cell as! StudentCell
        let student = studentModel!.getStudentAtIndex(i: indexPath.row)
        studentCell.setFromStudent(student: student)
        return studentCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController: EditStudentViewController = segue.destination as! EditStudentViewController
        let student: Student = studentModel!.getStudentAtIndex(i: tableView.indexPathForSelectedRow!.row).copy() as! Student
        
        destViewController.student = student
    }
    
    @IBAction func unwindFromCancel(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController: EditStudentViewController = unwindSegue.source as! EditStudentViewController
        let student = sourceViewController.student!
        NSLog("\(student.firstName) \(student.lastName)")
    }
    
    @IBAction func unwindFromSave(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController: EditStudentViewController = unwindSegue.source as! EditStudentViewController
        sourceViewController.updateStudentFromFields()
        let modifiedStudent = sourceViewController.student!
        let originalStudent: Student = studentModel!.getStudentAtIndex(i: tableView.indexPathForSelectedRow!.row)
        originalStudent.setFrom(other: modifiedStudent)
        
        tableView.reloadData()
    }
}
