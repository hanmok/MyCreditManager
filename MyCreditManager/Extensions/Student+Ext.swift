//
//  Student+Ext.swift
//  MyCreditManager
//
//  Created by Mac mini on 2022/11/30.
//

import Foundation

extension Student: Equatable {
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name
    }
}
