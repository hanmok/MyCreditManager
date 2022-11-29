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
    print(CompletionMessage.gradeUpdate(studentName: studentName, subjectName: subjectName, score: score).message)
    
    return targetStudent
}

func handleUpdatingGrade(from students: [Student], completion: (Student?) -> Void) {
    print(IntroMessage.gradeAddition.message)
    
    let input = readLine()
    guard let input = input, input != "" else {
        print(InputError.wrong.message)
        completion(nil)
        return
    }
    
    do {
        let targetStudent = try updateGrade(students: students, input: input)
        completion(targetStudent)
    } catch InputError.wrong {
        print(InputError.wrong.message)
    } catch GradeError.invalidStudent(let name) {
        print(GradeError.invalidStudent(name: name).message)
    } catch {
        
    }
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
    print(CompletionMessage.gradeDeletion(studentName: studentName, subjectName: subjectName).message)
    return targetStudent
}

func handleDeletingGrade(from students: [Student], completion: (Student?) -> Void) {
    print(IntroMessage.gradeDeletion.message)
    
    let input = readLine()
    guard let input = input, input != "" else {
        print(InputError.wrong.message)
        completion(nil)
        return
    }
    do {
        let targetStudent = try deleteGrade(students: students, input: input)
        completion(targetStudent)
    } catch InputError.wrong {
        print(InputError.wrong.message)
    } catch GradeError.invalidStudent(let studentName) {
        print(GradeError.invalidStudent(name: studentName).message)
    } catch {
        
    }
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
    print(IntroMessage.gradePrinting.message)
    let input = readLine()
    guard let input = input, input != "" else {
        print(InputError.wrong.message)
        return
    }
    do {
        try printScores(students: students, name: input)
    } catch StudentError.NotFound(let name) {
        print(StudentError.NotFound(name: name).message)
    } catch {
        return
    }
}
