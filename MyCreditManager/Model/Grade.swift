//
//  Grade.swift
//  MyCreditManager
//
//  Created by Mac mini on 2022/11/28.
//

import Foundation

struct Grade {
    var scores: [String: String] = [:]
    var average: Double {
        let validScores = scores
        var sum = 0.0
        for (_, scoreName) in validScores {
            let score = gradeRule[scoreName]!
            sum += score
        }
        return sum / Double(validScores.count)
    }
    let gradeRule: [String: Double] = [
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
    
    func printAverage() {
        print("평점 : \(average.truncate(places: 2))")
    }
}

// MARK: - Update Grade
func updateGrade(students: [Student], input: String) throws -> Student{
    let components = input.components(separatedBy: " ")
    guard components.count == 3 else {
        throw InputError.wrong
    }
    
    let (studentName, subjectName, score) = (components[0], components[1], components[2])
    
    guard var targetStudent = students.first(where: { $0.name == studentName}) else {
        throw GradeError.invalidStudent(name: studentName)
    }
    
    targetStudent.grade.scores[subjectName] = score
    printMessage(type: CompletionMessage.gradeUpdate(studentName: studentName, subjectName: subjectName, score: score))
    
    return targetStudent
}

func handleUpdatingGrade(from students: [Student], completion: (Student?) -> Void) {
    printMessage(type: IntroMessage.gradeAddition)
    let input = readLine()
    guard let input = input, input != "" else {
        printError(type: InputError.wrong)
        completion(nil)
        return
    }
    
    do {
        let targetStudent = try updateGrade(students: students, input: input)
        completion(targetStudent)
    } catch InputError.wrong {
        printError(type: InputError.wrong)
    } catch GradeError.invalidStudent(let name) {
        printError(type: GradeError.invalidStudent(name: name))
    } catch { }
    completion(nil)
}

// MARK: - Delete Grade
func deleteGrade(students: [Student], input: String) throws -> Student {
    let components = input.components(separatedBy: " ")
    guard components.count == 2 else {
        throw InputError.wrong
    }
    
    let (studentName, subjectName) = (components[0], components[1])
    guard var targetStudent = students.first(where: { $0.name == studentName}) else {
        throw GradeError.invalidStudent(name: studentName)
    }
    targetStudent.grade.scores[subjectName] = nil
    printMessage(type: CompletionMessage.gradeDeletion(studentName: studentName, subjectName: subjectName))
    return targetStudent
}

func handleDeletingGrade(from students: [Student], completion: (Student?) -> Void) {
    printMessage(type: IntroMessage.gradeDeletion)
    
    let input = readLine()
    guard let input = input, input != "" else {
        printError(type: InputError.wrong)
        completion(nil)
        return
    }
    do {
        let targetStudent = try deleteGrade(students: students, input: input)
        completion(targetStudent)
    } catch InputError.wrong {
        printError(type: InputError.wrong)
    } catch GradeError.invalidStudent(let studentName) {
        printError(type: GradeError.invalidStudent(name: studentName))
    } catch { }
    completion(nil)
}

// MARK: - Show Grade
func printScores(students: [Student], name: String) throws {
    guard let targetStudent = students.first(where: { $0.name == name}) else {
        throw StudentError.NotFound(name: name)
    }
    let grade = targetStudent.grade
    for (subjectName, grade) in grade.scores {
        print("\(subjectName): \(grade)")
    }
    grade.printAverage()
}

func handlePrintingScores(from students: [Student]) {
    printMessage(type: IntroMessage.gradePrinting)
    let input = readLine()
    guard let input = input, input != "" else {
        printError(type: InputError.wrong)
        return
    }
    do {
        try printScores(students: students, name: input)
    } catch StudentError.NotFound(let name) {

        printError(type: StudentError.NotFound(name: name))
    } catch {
        return
    }
}
