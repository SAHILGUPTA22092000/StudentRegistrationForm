//
//  studentDetails.swift
//  Student
//
//  Created by Sahil Gupta on 18/07/22.
//

import Foundation


struct Address{
    var buildingNumber : Int?
    var buildingName : String?
    var street : String?
    var city : String
    var state : String
    var pincode: String
}
    
class Student {
    var nameOfStudent : String
    var studentId : Int
    var addressOfStudent : Address
    var phoneNo : String
    var emailId : String
  
    init(_ name : String,_ rollNo : Int, _ address : Address,_ pNo : String, _ eId : String )
    {
        nameOfStudent = name
        studentId = rollNo
        addressOfStudent = address
        phoneNo = pNo
        emailId = eId
        
    }
   
}

// new page

class Details {
    var students : [Student] = []
    
    func addStudent(name : String,rollNo : Int,buildingnumeber:Int?,buildingName : String?, street : String?, city: String, state : String, pincode : String,pNo : String,eId : String )
    {
        let a=Address(buildingNumber: buildingnumeber, buildingName: buildingName, street: street, city: city, state: state, pincode: pincode)
        
        let s = Student(name,rollNo,a,pNo,eId)
        
        students.append(s)
    }
    //fetchStudent(rollno)
    func showStudentDetails(rollNo : Int32)
    {
        for student in students {
            if student.studentId == rollNo
            {
                print("Name of Student :",student.nameOfStudent)
                print("Student ID :",student.studentId)
                //_ = student.addressOfStudent.buildingNumber
                //_ = student.addressOfStudent.buildingName
                //_ = student.addressOfStudent.street
                
                print("Address : \n\(student.addressOfStudent.city),\(student.addressOfStudent.state),\(student.addressOfStudent.pincode)")
                print("Email Address:",student.emailId)
                print("Phone No",student.phoneNo)
                return
            }
        }
         
        print("Student not Found of Roll No \(rollNo)")
    }
   
    
}

var collegeDb = Details()



