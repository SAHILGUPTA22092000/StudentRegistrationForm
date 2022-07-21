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
    func fetchStudent(rollNo : String)->Student? {
       return collegeDb.students.filter{ $0.studentId == Int(rollNo) }.first
    }
}

var collegeDb = StudentRepository()
