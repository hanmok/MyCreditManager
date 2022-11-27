//
//  Student.swift
//  MyCreditManager
//
//  Created by Mac mini on 2022/11/28.
//

import Foundation




class Student {
    
    var students = [String]()
    
    
    func addStudent(_ name: String, nameList: [String]) throws {
        if name.count == 0 {
            throw AdditionError.Empty
        }
        if nameList.contains(name) {
            throw AdditionError.Duplicate
        }
    }
    
    
    func handleAddition(name: String) {
        
        do {
            try addStudent(name, nameList: students)
            students.append(name)
            print("\(name) 학생을 추가했습니다.")
            
        } catch AdditionError.Empty {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        } catch AdditionError.Duplicate {
            print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        } catch {
            print("another Error")
        }
    }
    
    
    func deleteStudent(_ name: String, nameList: [String]) throws {
        if nameList.contains(name) {
            print("\(name) 학생을 삭제하였습니다.")
        } else {
            throw DeletionError.NotFound
        }
    }
}

extension Student {
    
    enum AdditionError: Error {
        case Empty
        case Duplicate
    }

    enum DeletionError: Error {
        case NotFound
    }
    
    enum PromptMessages {
        case add
        case delete
        
        var message: String {
            switch self {
                case .add:
                    return "추가할 학생의 이름을 입력해주세요."
                case .delete:
                    return "삭제할 학생의 이름을 입력해주세요."
            }
        }
    }
}