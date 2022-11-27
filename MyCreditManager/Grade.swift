//
//  Grade.swift
//  MyCreditManager
//
//  Created by Mac mini on 2022/11/28.
//

import Foundation

// Student has Grade.
class Grade {
    var score: [String: Double] = [:]
}

extension Grade {
    
    enum AdditionInputError: Error {
        case InvalidForm
        
        /// student name
        case notFount(String)
        
        var message: String {
            switch self {
                case .InvalidForm:
                    return "입력이 잘못되었습니다. 다시 확인해주세요."
                case .notFount(let studentName):
                    return "\(studentName) 학생을 찾지 못했습니다."
            }
        }
    }
    
    enum PromptMessages {
        case add
        case delete
        
        
        var message: String {
            switch self {
                case .add:
                    return """
성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
입력예) Mickey Swift A+
만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
"""
                case .delete:
                    return """
성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.
입력예) Mickey Swift
"""
            }
        }
    }
}
