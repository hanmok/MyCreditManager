//
//  Student.swift
//  MyCreditManager
//
//  Created by Mac mini on 2022/11/28.
//

import Foundation



class Student {
    
    var name: String
    var grade = Grade()
    
    init(name: String) {
        self.name = name
    }
    
    static func doesContain(_ list: [Student], target: String) -> Bool {
        for eachStudent in list {
            if eachStudent.name == target {
                return true
            }
        }
        return false
    }
    
    
    static func addStudent(_ name: String, to list: [Student]) throws {
        if name.count == 0 {
            throw AdditionError.Empty
        }
        
        for student in list {
            if student.name == name {
                throw AdditionError.Duplicate
            }
        }
    }
    
    @discardableResult
    static func handleAddition(name: String, list: [Student]) -> [Student]? {
        var newList = list
        do {

            try Student.addStudent(name, to: list)

            newList.append(Student(name: name))
            
            print("\(name) 학생을 추가했습니다.")
            return newList
            
        } catch AdditionError.Empty {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            
        } catch AdditionError.Duplicate {
            print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        } catch {
            print("another Error")
        }
        return nil
    }
    
    @discardableResult
    static func deleteStudent(_ name: String, from list: [Student]) throws -> [Student]{
        var newList = list
        if newList.contains(where: { $0.name == name}) {
            newList.removeAll(where: { $0.name == name })
            return newList
        } else {
            throw DeletionError.NotFound
            
        }
    }
    
    @discardableResult
    static func handleDeletion(name: String, list: [Student]) -> [Student]? {
        
        do {
            let ret = try Student.deleteStudent(name, from: list)
            
            print("\(name) 학생을 삭제하였습니다.")
            return ret
        } catch DeletionError.NotFound {
            print("\(name) 학생을 찾지 못했습니다.")
        
        } catch {
            print("another Error")
        }
        return nil
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
