//
//  AllStudentViewController.swift
//  Student
//
//  Created by Sahil Gupta on 19/07/22.
//

import UIKit

class StudentTableViewController: UIViewController {
    
    

    @IBOutlet weak var studentTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTableView.register(StudentTableViewCell.nib(), forCellReuseIdentifier: StudentTableViewCell.studentTableViewCellIdentifier)
        studentTableView.delegate = self
        studentTableView.dataSource = self
        studentTableView.rowHeight=UITableView.automaticDimension
//        studentTableView.estimatedRowHeight=100
    }
}

//MARK: UITableViewDelegate,UITableViewDataSource
extension StudentTableViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeDb.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentTableViewCell = studentTableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath) as! StudentTableViewCell
        studentTableViewCell.cellConfigure(with: collegeDb.students[indexPath.row].nameOfStudent,imageName: "gear")
        return studentTableViewCell
    }
}
