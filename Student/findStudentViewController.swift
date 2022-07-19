//
//  findStudentViewController.swift
//  Student
//
//  Created by Sahil Gupta on 18/07/22.
//

import UIKit

class findStudentViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var rollID: UITextField!
    
    @IBOutlet weak var findStudentSubmitButton: UIButton!
    
    @IBOutlet weak var foundStudentName: UITextField!
    
    @IBOutlet weak var foundStudentId: UITextField!
    @IBOutlet weak var foundStudentAddress: UITextField!
    
    @IBOutlet weak var foundStudentEmailId: UITextField!
    
    @IBOutlet weak var foundStudentPhoneNo: UITextField!
    
    @IBOutlet weak var rollError: UILabel!
    
    @IBAction func rollNoEntered(_ sender: Any) {
        if let id = rollID.text
        {
            if let errorMessage = invalidId(id)
            {
                rollError.text = errorMessage
                rollError.isHidden = false
            }
            else
            {
                rollError.isHidden = true
            }
        }
    }
    func invalidId (_ value : String)->String?
    {
        if (value.isEmpty)
        {
            return "Field is Required "
        }
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set)
        {
            return "Field can only contain numbers"
        }
        
        return nil
    }
    
    func checkForValidFSearch()
    {
        if rollError.isHidden
        {
            findStudentSubmitButton.isEnabled = true
        }
        else
        {
            findStudentSubmitButton.isEnabled = false
        }

    }
    
    @IBAction func searchStudentButtonPressed(_ sender: Any) {
        for student in collegeDb.students {
            if student.studentId == Int(rollID.text!)
            {
                foundStudentName.isHidden=false
                foundStudentId.isHidden=false
                foundStudentAddress.isHidden=false
                foundStudentEmailId.isHidden=false
                foundStudentPhoneNo.isHidden=false
                foundStudentName.text=student.nameOfStudent
                foundStudentId.text=String(student.studentId)
                foundStudentAddress.text="\(student.addressOfStudent.city),\(student.addressOfStudent.state),\(student.addressOfStudent.pincode)"
                foundStudentEmailId.text=student.emailId
                foundStudentPhoneNo.text=student.phoneNo
                
            }
    }
    
    
    
    
    
    
    
    
    
    
    
    func viewDidLoad()
    {
        super.viewDidLoad()
        rollID.delegate=self
        let tapGesture=UITapGestureRecognizer(target: self, action: #selector(RegisterStudentViewController.tapHandler))
        view.addGestureRecognizer(tapGesture)
        rollError.isHidden=false
        rollError.text=""
        foundStudentName.isHidden=true
        foundStudentId.isHidden=true
        foundStudentAddress.isHidden=true
        foundStudentEmailId.isHidden=true
        foundStudentPhoneNo.isHidden=true
    }
    func tapHandler ()
     {
         view.endEditing(true)
     }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
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
}
