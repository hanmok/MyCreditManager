//
//  InputError.swift
//  MyCreditManager
//
//  Created by Mac mini on 2022/11/30.
//

import Foundation

enum InputError: Error, CustomStringConvertible {
    case wrongInitial
    case wrong
    
    var description: String {
        switch self {
            case .wrong:
                return "입력이 잘못되었습니다. 다시 확인해주세요."
            case .wrongInitial:
                return "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
        }
    }
}

func printError<T: Error>(type: T) where T: CustomStringConvertible {
    print(type.description)
}
