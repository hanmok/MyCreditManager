//
//  ThrowCatchPractice.swift
//  MyCreditManager
//
//  Created by Mac mini on 2022/11/28.
//

import Foundation


enum LoginError: Error {
    case incompleteForm
    case invalidEmail
    case incorrectPasswordLength
}

func login() throws {
    let email = "someMail"
    let password = "somePassword"
    
    if email.isEmpty || password.isEmpty {
        throw LoginError.incompleteForm
    }
    
    if password.count < 8 {
        throw LoginError.incorrectPasswordLength
    }
}



func loginTest(mail: String, password: String) {
    do {
        try login()
    } catch LoginError.incompleteForm {
        print("hi")
    } catch LoginError.incorrectPasswordLength {
        print("bye")
    } catch {
        print("another")
    }
}
