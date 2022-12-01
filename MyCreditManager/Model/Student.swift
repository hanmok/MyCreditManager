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
    printMessage(type: IntroMessage.studentAddition)
    let input = readLine()
    guard let name = input, name != "" else {
        printError(type: InputError.wrong)
        return
    }
    
    do {
        let student = try makeStudent(name: name, students: students)

        printMessage(type: CompletionMessage.studentAddition(name: name))
        completion(student)
        
    } catch StudentError.Duplicate {
        printError(type: StudentError.Duplicate(name: name))
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
    printMessage(type: IntroMessage.studentDeletion)
    let input = readLine()
    guard let name = input, name != "" else {
        printError(type: InputError.wrong)
        return
    }
    
    do {
        let student = try getDeletingStudent(name: name, students: students)
        printMessage(type: CompletionMessage.studentDeletion(name: name))
        completion(student)
    } catch InputError.wrong {
        printError(type: InputError.wrong)
    } catch StudentError.NotFound {
        printError(type: StudentError.NotFound(name: name))
    } catch {
        return
    }
}
