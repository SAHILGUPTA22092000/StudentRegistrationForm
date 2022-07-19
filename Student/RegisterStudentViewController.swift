//
//  RegisterStudentViewController.swift
//  Student
//
//  Created by Sahil Gupta on 18/07/22.
//

import UIKit

class RegisterStudentViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var nameOfStudent: UITextField!
    @IBOutlet weak var rollNumber: UITextField!
    @IBOutlet weak var buildingNo: UITextField!
    @IBOutlet weak var buildingName: UITextField!
    @IBOutlet weak var streetName: UITextField!
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var stateName: UITextField!
    @IBOutlet weak var pinCode: UITextField!
    @IBOutlet weak var emailId: UITextField!
    @IBOutlet weak var phoneNo: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var nameError: UILabel!
    @IBOutlet weak var idError: UILabel!
    @IBOutlet weak var cityError: UILabel!
    @IBOutlet weak var stateError: UILabel!
    @IBOutlet weak var pinCodeError: UILabel!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var phoneError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm()
        nameOfStudent.delegate=self
        rollNumber.delegate=self
        buildingNo.delegate=self
        buildingName.delegate=self
        streetName.delegate=self
        cityName.delegate=self
        stateName.delegate=self
        pinCode.delegate=self
        emailId.delegate=self
        phoneNo.delegate=self
        let tapGesture=UITapGestureRecognizer(target: self, action: #selector(RegisterStudentViewController.tapHandler))
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
   @objc func tapHandler ()
    {
        view.endEditing(true)
    }
    
    func resetForm ()
    {
        submitButton.isEnabled = false
        
        nameError.isHidden = false
        idError.isHidden = false
        cityError.isHidden = false
        stateError.isHidden = false
        pinCodeError.isHidden = false
        emailError.isHidden = false
        phoneError.isHidden = false
        
        nameError.text=""
        idError.text=""
        cityError.text=""
        stateError.text=""
        pinCodeError.text=""
        emailError.text=""
        phoneError.text=""
        
        nameOfStudent.text = ""
        nameOfStudent.text = ""
        rollNumber.text = ""
        buildingNo.text = ""
        buildingName.text = ""
        streetName.text = ""
        cityName.text = ""
        stateName.text = ""
        pinCode.text = ""
        emailId.text = ""
        phoneNo.text = ""
        
    }
    
    
    
    @IBAction func nameChange(_ sender: Any) {
        if let name = nameOfStudent.text
        {
            if let errorMessage = invalidName(name)
            {
                nameError.text = errorMessage
                nameError.isHidden = false
            }
            else
            {
                nameError.isHidden = true
            }
        }
        checkForValidForm()
    }
    func invalidName (_ value : String)->String?
    {
        if (value.isEmpty)
        {
            return "Field is Required "
        }
        let characters = CharacterSet.letters
        let nonCharacters=characters.inverted
        if value.rangeOfCharacter(from: nonCharacters) != nil
        {
            return "Field can only Contain Letters"
        }
        return nil
    }
   
    
    
   
    @IBAction func idChange(_ sender: Any) {
        
        if let id = rollNumber.text
        {
            if let errorMessage = invalidId(id)
            {
                idError.text = errorMessage
                idError.isHidden = false
            }
            else
            {
                idError.isHidden = true
            }
        }
        checkForValidForm()
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
    
    
 
    @IBAction func cityChanged(_ sender: Any) {
        if let city = cityName.text
        {
            if let errorMessage = invalidName(city)
            {
                cityError.text = errorMessage
                cityError.isHidden = false
            }
            else
            {
                cityError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    @IBAction func stateChanged(_ sender: Any) {
        if let state = stateName.text
        {
            if let errorMessage = invalidName(state)
            {
                stateError.text = errorMessage
                stateError.isHidden = false
            }
            else
            {
                stateError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    @IBAction func pincodeChanged(_ sender: Any) {
        if let pin = pinCode.text
        {
            if let errorMessage = invalidId(pin)
            {
                pinCodeError.text = errorMessage
                pinCodeError.isHidden = false
            }
            else
            {
                pinCodeError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    
    
    @IBAction func emailChanged(_ sender: Any) {
        checkForValidForm()
        if let email = emailId.text
        {
            if let errorMessage = invalidEmail(email)
            {
                emailError.text = errorMessage
                emailError.isHidden = false
            }
            else
            {
                emailError.isHidden = true
            }
        }
        checkForValidForm()
    }
    func invalidEmail (_ value : String)->String?
    {
        if (value.isEmpty)
        {
            return "Field is Required "
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if !emailTest.evaluate(with: value)
        {
            return "Invalid Email Address"
        }
        return nil
    }
    
    
    
    @IBAction func phoneChanged(_ sender: Any) {
        
        if let phone = phoneNo.text
        {
            if let errorMessage = invalidPhone(phone)
            {
                phoneError.text = errorMessage
                phoneError.isHidden = false
            }
            else
            {
                phoneError.isHidden = true
            }
        }
        checkForValidForm()
    }
    func invalidPhone (_ value : String)->String?
    {
        if value.count != 10
        {
            return "Phone Number must contain 10 digits "
        }
        if value.isEmpty
        {
            return "Phone Number is Required "
        }
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set)
        {
            return "Phone Number can only contain numbers"
        }
        return nil
    }
    
    
    func checkForValidForm()
    {
        if nameError.isHidden && idError.isHidden && cityError.isHidden && stateError.isHidden && pinCodeError.isHidden && emailError.isHidden && phoneError.isHidden
        {
            submitButton.isEnabled = true
        }
        else
        {
            submitButton.isEnabled = false
        }

    }
    
    
    
    @IBAction func studentRegisterSubmitButton(_ sender: Any) {
        print("Submit Button Tapped")
        //let alert = UIAlertController(title: "Alert", message: "Form is Submitted", preferredStyle: .alert)
        //alert.addAction(UIAlertAction(title: "OK", style: .default))
        //present(alert, animated: true)
        
        let rno = Int(rollNumber.text!)!
        let bno = Int(buildingNo.text!)
        
        collegeDb.addStudent(name: nameOfStudent.text!, rollNo: rno, buildingnumeber: bno, buildingName: buildingName?.text, street: streetName?.text, city: cityName.text!, state: stateName.text!, pincode: pinCode.text!, pNo: phoneNo.text!, eId: emailId.text!)
    
        collegeDb.showStudentDetails(rollNo: 12)
        resetForm()
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}
