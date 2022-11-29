//
//  Student.swift
//  MyCreditManager
//
//  Created by Mac mini on 2022/11/28.
//

import Foundation

struct Student {
    var name: String
    var grade = Grade()
}

// MARK: - Add Student
func makeStudent(name: String, students: [Student]) throws -> Student {
    guard students.contains(where: {$0.name == name}) == false else {
        throw StudentError.Duplicate(name: name)
    }
    return Student(name: name)
}

func handleStudentAddition(students: [Student], completion: (Student?) -> () ) {
    print(IntroMessage.studentAddition.message)
    let input = readLine()
    guard let name = input, name != "" else {
        print(InputError.wrong.message)
        return
    }
    
    do {
        let student = try makeStudent(name: name, students: students)
        print(CompletionMessage.studentAddition(name: name).message)
        completion(student)
        
    } catch StudentError.Duplicate {
        print(StudentError.Duplicate(name: name).message)
    } catch {
        return
    }
}

// MARK: - Delete Student
func getDeletingStudent(name: String, students: [Student]) throws -> Student {
    guard let matchingStudent = students.first(where: {$0.name == name}) else {
        throw StudentError.NotFound(name: name)
    }
    return matchingStudent
}

func handleStudentDeletion(students: [Student], completion: (Student?) -> ()) {
    print(IntroMessage.studentDeletion.message)
    let input = readLine()
    guard let name = input, name != "" else {
        print(InputError.wrong.message)
        return
    }
    
    do {
        let student = try getDeletingStudent(name: name, students: students)
        print(CompletionMessage.studentDeletion(name: name).message)
        completion(student)
    } catch InputError.wrong {
        print(InputError.wrong.message)
    } catch StudentError.NotFound {
        print(StudentError.NotFound(name: name).message)
    } catch {
        return
    }
}
