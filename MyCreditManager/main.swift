//
//  main.swift
//  MycreditManager
//
//  Created by Mac mini on 2022/11/28.
//

import Foundation

print("Hello, World!")


// MARK: - 학생 추가


var studentList = [Student]()

var command = ""

while command != "X" {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    command = readLine()!
    
    switch command {
        case "1":
            print(Student.PromptMessages.add.message)
            let studentName = readLine()!

            if let newList = Student.handleAddition(name: studentName, list: studentList) {
                studentList = newList
            }
            
        case "2":
            print(Student.PromptMessages.delete.message)
            let studentName = readLine()!
            
            if let newList = Student.handleDeletion(name: studentName, list: studentList) {
                studentList = newList
            }
            
        case "3":
            print(Grade.PromptMessages.add.message)
            let input = readLine()!
//            let sub = input.components(separatedBy: " ")
            Grade.handleInput(input: input, list: studentList)
            // input 을 세 파트로 나누기.
            // 학생이 있는지 없는지 확인
                // 있으면 과목이 있는지 없는지 확인
                // 있으면 업데이트, 없으면 추가.
            // 없으면 Error !
            
        case "4":
            print(Grade.PromptMessages.delete.message)
            let input = readLine()!
            Grade.handleDeletion(input: input, list: studentList)
            
        case "5":break // 평점 보기 
        case "X":
            print("프로그램을 종료합니다...")
            break
        default: print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        
    }
    
    for student in studentList {
        print("info: \(student.name), \(student.grade.scores)")
    }
    
}
