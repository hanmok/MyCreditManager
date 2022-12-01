//
//  main.swift
//  MycreditManager
//
//  Created by Mac mini on 2022/11/28.
//

import Foundation

enum MenuSelectionType: String {
    case studentAddition = "1"
    case studentDeletion = "2"
    case scoreUpdate = "3"
    case scoreDeletion = "4"
    case scorePrinting = "5"
    case end = "X"
}

var students = [Student]()

func run() {
    printMessage(type: IntroMessage.main)
    guard let command = readLine() else {
        run()
        return
    }
    printError(type: InputError.wrong)
    switch command {
    case MenuSelectionType.studentAddition.rawValue:
        handleStudentAddition(students: students) { student in
            guard let student = student else { return }
            students.append(student)
        }
        
    case MenuSelectionType.studentDeletion.rawValue:
        handleStudentDeletion(students: students) { student in
            guard let deletingStudent = student else { return }
            students.removeAll(where: { $0 == deletingStudent })
        }
        
    case MenuSelectionType.scoreUpdate.rawValue:
        handleUpdatingGrade(from: students) { student in
            guard let student = student else { return }
            students = getNewStudents(from: students, updated: student)
        }
        
    case MenuSelectionType.scoreDeletion.rawValue:
        handleDeletingGrade(from: students) { student in
            guard let student = student else { return }
            students = getNewStudents(from: students, updated: student)
        }
        
    case MenuSelectionType.scorePrinting.rawValue:
        handlePrintingScores(from: students)
        
    case MenuSelectionType.end.rawValue:
        printMessage(type: CompletionMessage.endProgram)
        return
        
    default:
        printError(type: InputError.wrongInitial)
    }
    run()
}

run()

func getNewStudents(from students: [Student], updated student: Student) -> [Student] {
    var newStudents = students
    guard let studentIndex = students.firstIndex(of: student) else { fatalError() }
    newStudents[studentIndex] = student
    return newStudents
}
