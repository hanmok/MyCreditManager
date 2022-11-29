//
//  IntroMessage.swift
//  MyCreditManager
//
//  Created by Mac mini on 2022/11/30.
//

import Foundation

enum IntroMessage {
    case main
    
    case studentAddition
    case studentDeletion
    
    case gradeAddition
    case gradeDeletion
    case gradePrinting
    
    var message: String {
        switch self {
            case .main:
                return """
원하는 기능을 입력해주세요
1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료
"""
            case .studentAddition:
                return "추가할 학생의 이름을 입력해주세요."
            case .studentDeletion:
                return "삭제할 학생의 이름을 입력해주세요."
            case .gradeAddition:
                return """
성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
입력예) Mickey Swift A+
만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
"""
            case .gradeDeletion:
                return """
성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.
입력예) Mickey Swift
"""
            case .gradePrinting:
                return "평점을 알고싶은 학생의 이름을 입력해주세요."
        }
    }
}
