//
//  StudentError.swift
//  MyCreditManager
//
//  Created by Mac mini on 2022/11/30.
//

import Foundation

enum StudentError: Error {
    case Duplicate(name: String)
    case NotFound(name: String)
    
    var message: String {
        switch self {
            case .Duplicate(let name):
                return "\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다."
            case .NotFound(let name):
                return "\(name) 학생을 찾지 못했습니다."
        }
    }
}
