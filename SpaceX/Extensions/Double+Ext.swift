//
//  Double+Ext.swift
//  SpaceX
//
//  Created by Enes Sancar on 27.05.2023.
//

import Foundation

extension Double {
    func unixToDate() -> Date {
        Date(timeIntervalSince1970: self)
    }
}
