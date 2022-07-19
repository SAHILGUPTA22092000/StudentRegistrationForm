//
//  AllStudentViewController.swift
//  Student
//
//  Created by Sahil Gupta on 19/07/22.
//

import UIKit

class AllStudentViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    

    @IBOutlet weak var AllStudentPageTable: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AllStudentPageTable.register(AllStudentViewCell.nib(), forCellReuseIdentifier: AllStudentViewCell.allStudentViewCellIdentifier)
        AllStudentPageTable.delegate = self
        AllStudentPageTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeDb.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allStudentViewCell = AllStudentPageTable.dequeueReusableCell(withIdentifier: "AllStudentViewCell", for: indexPath) as! AllStudentViewCell
        allStudentViewCell.allStudentViewCellConfigure(with: collegeDb.students[indexPath.row].nameOfStudent,imageName: "gear")
        return allStudentViewCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
