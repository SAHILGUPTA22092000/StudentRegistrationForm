//
//  RegisterStudentViewController.swift
//  Student
//
//  Created by Sahil Gupta on 18/07/22.
//

import UIKit

class RegisterStudentViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var rollNoTF: UITextField!
    @IBOutlet weak var buildingNoTF: UITextField!
    @IBOutlet weak var buildingNameTF: UITextField!
    @IBOutlet weak var streetTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var stateTF: UITextField!
    @IBOutlet weak var pinCodeTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneNoTF: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var nameErrorLbl: UILabel!
    @IBOutlet weak var rollNoErrorLbl: UILabel!
    @IBOutlet weak var cityErrorLbl: UILabel!
    @IBOutlet weak var stateErrorLbl: UILabel!
    @IBOutlet weak var pinCodeErrorLbl: UILabel!
    @IBOutlet weak var emailErrorLbl: UILabel!
    @IBOutlet weak var phoneErrorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm()
        nameTF.delegate=self
        rollNoTF.delegate=self
        buildingNoTF.delegate=self
        buildingNameTF.delegate=self
        streetTF.delegate=self
        cityTF.delegate=self
        stateTF.delegate=self
        pinCodeTF.delegate=self
        emailTF.delegate=self
        phoneNoTF.delegate=self
        let tapGesture=UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        view.addGestureRecognizer(tapGesture)
    }
   @objc func tapHandler () {
        view.endEditing(true)
    }
    
    func resetForm () {
        submitButton.isEnabled = false
        
        nameErrorLbl.isHidden = false
        rollNoErrorLbl.isHidden = false
        cityErrorLbl.isHidden = false
        stateErrorLbl.isHidden = false
        pinCodeErrorLbl.isHidden = false
        emailErrorLbl.isHidden = false
        phoneErrorLbl.isHidden = false
        
        nameErrorLbl.text=""
        rollNoErrorLbl.text=""
        cityErrorLbl.text=""
        stateErrorLbl.text=""
        pinCodeErrorLbl.text=""
        emailErrorLbl.text=""
        phoneErrorLbl.text=""
        
        nameTF.text = ""
        nameTF.text = ""
        rollNoTF.text = ""
        buildingNoTF.text = ""
        buildingNameTF.text = ""
        streetTF.text = ""
        cityTF.text = ""
        stateTF.text = ""
        pinCodeTF.text = ""
        emailTF.text = ""
        phoneNoTF.text = ""
        
    }
    
    
    
    @IBAction func nameChange(_ sender: Any) {
        if let name = nameTF.text {
            if let errorMessage = invalidName(name) {
                nameErrorLbl.text = errorMessage
                nameErrorLbl.isHidden = false
            }
            else {
                nameErrorLbl.isHidden = true
            }
        }
        checkForValidForm()
    }
  
    @IBAction func idChange(_ sender: Any) {
        
        if let id = rollNoTF.text {
            if let errorMessage = invalidId(id) {
                rollNoErrorLbl.text = errorMessage
                rollNoErrorLbl.isHidden = false
            }
            else {
                rollNoErrorLbl.isHidden = true
            }
        }
        checkForValidForm()
    }

    @IBAction func cityChanged(_ sender: Any) {
        if let city = cityTF.text {
            if let errorMessage = invalidName(city) {
                cityErrorLbl.text = errorMessage
                cityErrorLbl.isHidden = false
            }
            else {
                cityErrorLbl.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    @IBAction func stateChanged(_ sender: Any) {
        if let state = stateTF.text {
            if let errorMessage = invalidName(state) {
                stateErrorLbl.text = errorMessage
                stateErrorLbl.isHidden = false
            }
            else {
                stateErrorLbl.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    @IBAction func pincodeChanged(_ sender: Any) {
        if let pin = pinCodeTF.text {
            if let errorMessage = invalidId(pin) {
                pinCodeErrorLbl.text = errorMessage
                pinCodeErrorLbl.isHidden = false
            }
            else {
                pinCodeErrorLbl.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    @IBAction func emailChanged(_ sender: Any) {
        if let email = emailTF.text {
            if let errorMessage = invalidEmail(email) {
                emailErrorLbl.text = errorMessage
                emailErrorLbl.isHidden = false
            }
            else {
                emailErrorLbl.isHidden = true
            }
        }
        checkForValidForm()
    }
    private func invalidEmail (_ value : String) -> String? {
        if value.isEmpty {
            return "Field is Required "
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if !emailTest.evaluate(with: value) {
            return "Invalid Email Address"
        }
        return nil
    }
    
    
    
    @IBAction func phoneChanged(_ sender: Any) {
        if let phone = phoneNoTF.text {
            if let errorMessage = invalidPhone(phone) {
                phoneErrorLbl.text = errorMessage
                phoneErrorLbl.isHidden = false
            }
            else {
                phoneErrorLbl.isHidden = true
            }
        }
        checkForValidForm()
    }
    private func invalidPhone (_ value : String) -> String? {
        if value.count != 10 {
            return "Phone Number must contain 10 digits "
        }
        if value.isEmpty {
            return "Phone Number is Required "
        }
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set){
            return "Phone Number can only contain numbers"
        }
        return nil
    }
    
    
    func invalidName (_ value : String) -> String? {
        if (value.isEmpty) {
            return "Field is Required "
        }
        let characters = CharacterSet.letters
        let nonCharacters=characters.inverted
        if value.rangeOfCharacter(from: nonCharacters) != nil {
            return "Field can only Contain Letters"
        }
        return nil
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
    
    func checkForValidForm() {
        if nameErrorLbl.isHidden && rollNoErrorLbl.isHidden && cityErrorLbl.isHidden && stateErrorLbl.isHidden && pinCodeErrorLbl.isHidden && emailErrorLbl.isHidden && phoneErrorLbl.isHidden {
            submitButton.isEnabled = true
        }
        else {
            submitButton.isEnabled = false
        }

    }
    
    
    
    @IBAction func studentRegisterSubmitButton(_ sender: Any) {
        print("Submit Button Tapped")
        //let alert = UIAlertController(title: "Alert", message: "Form is Submitted", preferredStyle: .alert)
        //alert.addAction(UIAlertAction(title: "OK", style: .default))
        //present(alert, animated: true)
        
        //Doubt
        guard let rollText = rollNoTF.text else { return }
        guard let rno = Int(rollText) else { return }
        let bno = Int(buildingNoTF.text!)
        
        let tempAdress=Address(buildingNumber: bno, buildingName: buildingNameTF?.text, street: streetTF?.text, city: cityTF.text!, state: stateTF.text!, pincode: pinCodeTF.text!)
        
        let tempStudent = Student(nameTF.text!,rno,tempAdress,phoneNoTF.text!,emailTF.text!)
        
        collegeDb.addStudent(tempStudent)
    
        resetForm()
        
    }

    @IBAction func findButtontToSearchStudentPagePressed(_ sender: Any) {
        if let findButtonPressed = storyboard?.instantiateViewController(withIdentifier: "findStudentViewController") as? FindStudentViewController {
        present(findButtonPressed, animated: true)
        }
    }
    
}

//MARK: UITextFieldDelegate
extension RegisterStudentViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
