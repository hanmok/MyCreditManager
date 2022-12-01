//
//  GradeError.swift
//  MyCreditManager
//
//  Created by Mac mini on 2022/11/30.
//

import Foundation

enum GradeError: Error, CustomStringConvertible {
    case invalidStudent(name: String)
    
    var description: String {
        switch self {
            case .invalidStudent(let studentName):
                return "\(studentName) 학생을 찾지 못했습니다."
        }
    }
}
