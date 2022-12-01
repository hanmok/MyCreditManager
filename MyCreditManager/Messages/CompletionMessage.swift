//
//  CompletionMessage.swift
//  MyCreditManager
//
//  Created by Mac mini on 2022/11/30.
//

import Foundation

protocol Message {}

enum CompletionMessage: Message, CustomStringConvertible {
    case studentAddition(name: String)
    case studentDeletion(name: String)
    case gradeUpdate(studentName: String, subjectName: String, score: String)
    case gradeDeletion(studentName: String, subjectName: String)
    case endProgram
    
    var description: String {
        switch self {
            case .studentAddition(let name):
                return "\(name) 학생을 추가했습니다."
            case .studentDeletion(let name):
                return "\(name) 학생을 삭제하였습니다."
            case .gradeUpdate(let studentName, let subjectName, let score):
                return "\(studentName) 학생의 \(subjectName) 과목이 \(score)로 추가(변경)되었습니다."
            case .gradeDeletion(let studentName, let subjectName):
                return "\(studentName) 학생의 \(subjectName) 과목의 성적이 삭제되었습니다."
            case .endProgram:
                return "프로그램을 종료합니다..."
        }
    }
}

func printMessage<T: Message>(type: T) where T: CustomStringConvertible {
    print(type.description)
}
