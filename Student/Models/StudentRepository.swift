//
//  StudentRepository.swift
//  Student
//
//  Created by Sahil Gupta on 20/07/22.
//

import Foundation

class StudentRepository {
    var students : [Student] = []
    
    func addStudent(_ tempStudent : Student ) {
        students.append(tempStudent)
    }
    //fetchStudent(rollno)
    func fetchStudent(rollNo : String)->Student? {
       /* for student in students {
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
         
        print("Student not Found of Roll No \(rollNo)")*/
        
       return collegeDb.students.filter{ $0.studentId == Int(rollNo) }.first
    }
   
    
}

var collegeDb = StudentRepository()
