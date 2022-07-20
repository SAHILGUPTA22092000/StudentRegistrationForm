import UIKit

class FindStudentViewController: UIViewController {
    @IBOutlet weak var rollNoTF: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var idTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneNoTF: UITextField!
    @IBOutlet weak var rollErrorLbl: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBAction func rollNoEntered(_ sender: Any) {
        if let id = rollNoTF.text {
            if let errorMessage = invalidId(id) {
                rollErrorLbl.text = errorMessage
                rollErrorLbl.isHidden = false
                submitButton.isEnabled = false
            }
            else {
                rollErrorLbl.isHidden = true
                submitButton.isEnabled = true
            }
        }
    }
    func invalidId (_ value : String) -> String? {
        if (value.isEmpty) {
            return "Field is Required "
        }
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set) {
            return "Field can only contain numbers"
        }
        return nil
    }

    @IBAction func searchStudentButtonPressed(_ sender: Any) {
        /*for student in collegeDb.students
        {
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
            
        }*/
        guard let rollNo = rollNoTF.text else { return }
        if let tempStudent = collegeDb.fetchStudent(rollNo: rollNo ) {
                shouldShowStudentDetails(showName: false, showOthers: false)
                nameTF.text = tempStudent.nameOfStudent
                idTF.text = String(tempStudent.studentId)
            // Address not complete
                addressTF.text = "\(tempStudent.addressOfStudent.city),\(tempStudent.addressOfStudent.state),\(tempStudent.addressOfStudent.pincode)"
                emailTF.text = tempStudent.emailId
                phoneNoTF.text = tempStudent.phoneNo
        }
        else {
            nameTF.text = "Student Not Found"
            shouldShowStudentDetails(showName: false, showOthers: true)
            return
        }
    }
    
    private func shouldShowStudentDetails(showName: Bool, showOthers: Bool) {
        nameTF.isHidden = showName
        idTF.isHidden = showOthers
        addressTF.isHidden = showOthers
        emailTF.isHidden = showOthers
        phoneNoTF.isHidden = showOthers
    }
    
    override func viewDidLoad() {
          super.viewDidLoad()
          submitButton.isEnabled = false
          rollNoTF.delegate = self
          let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
          view.addGestureRecognizer(tapGesture)
          rollErrorLbl.isHidden = false
          rollErrorLbl.text = ""
          shouldShowStudentDetails(showName: true, showOthers: true)

      }
   @objc func tapHandler () {
         view.endEditing(true)
     }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if  let nextButton = storyboard?.instantiateViewController(withIdentifier: "StudentTableViewController") as? StudentTableViewController {
        present(nextButton, animated: true)
        }
    }
}

//MARK: UITextFieldDelegate
extension FindStudentViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
