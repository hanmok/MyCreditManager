//
//  Grade.swift
//  MyCreditManager
//
//  Created by Mac mini on 2022/11/28.
//

import Foundation

// Student has Grade.
class Grade {
    var scores: [String: Double] = [:]
    
    static let gradeRule: [String: Double] = [
        "A+": 4.5,
        "A": 4.0,
        "B+": 3.5,
        "B": 3.0,
        "C+": 2.5,
        "C": 2.0,
        "D+": 1.5,
        "D": 1.0,
        "F": 0
    ]
    
    static func handleInput(input: String, list: [Student]) {
        let sub = input.components(separatedBy: " ")
        if sub.count == 3 {

            let name = sub[0]
            let gradeName = sub[1]
            let score = sub[2]
            
            // 중복
            if list.map({ $0.name }).contains(name) {
                if let validScore = Grade.gradeRule[score] {

                    let target = list.first(where: { $0.name == name})!
                    target.grade.scores[gradeName] = validScore

                } else {
                    print(Grade.AdditionInputError.InvalidForm.message)
                }
                
            } else {
                print(Grade.AdditionInputError.notFount(name).message)
            }
            
        } else {
            // error!
            print(Grade.AdditionInputError.InvalidForm.message)
        }
    }
    
    static func handleDeletion(input: String, list: [Student]) {
        let sub = input.components(separatedBy: " ")
        if sub.count == 2 {
            let name = sub[0]
            let gradeName = sub[1]
            
            if list.map({ $0.name }).contains(name) {
                let targetStudent = list.first(where: { $0.name == name})!
                
//                if targetStudent.grade.scores
                if let validSubjectName = targetStudent.grade.scores[gradeName] {
                    targetStudent.grade.scores[gradeName] = nil
                    print("\(name) 학생의 \(gradeName) 과목의 성적이 삭제되었습니다.")
                } else {
                    print(Grade.AdditionInputError.InvalidForm.message)
                }
                
            } else {
                print(Grade.AdditionInputError.notFount(name).message)
            }
        }
    }
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
