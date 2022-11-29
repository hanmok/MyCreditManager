//
//  Double+Ext.swift
//  MyCreditManager
//
//  Created by Mac mini on 2022/11/29.
//

import Foundation

extension Double {
    func truncate(places : Int)-> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
