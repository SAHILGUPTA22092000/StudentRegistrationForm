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
  
    init(_ name : String,_ rollNo : Int, _ address : Address,_ pNo : String, _ eId : String ) {
        nameOfStudent = name
        studentId = rollNo
        addressOfStudent = address
        phoneNo = pNo
        emailId = eId
        
    }
}





