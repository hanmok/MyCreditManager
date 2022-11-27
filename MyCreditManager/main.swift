//
//  main.swift
//  MycreditManager
//
//  Created by Mac mini on 2022/11/28.
//

import Foundation

print("Hello, World!")



// MARK: - 메뉴




// MARK: - 학생 추가

let student = Student()

var command = ""

while command != "X" {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    command = readLine()!
    
    switch command {
        case "1":
            print(Student.PromptMessages.add.message)
            let studentName = readLine()!
            student.handleAddition(name: studentName)
        case "2":break
        case "3":break
        case "4":break
        case "5":break
        case "X":break
        default: print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}
