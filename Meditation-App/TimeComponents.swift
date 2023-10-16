//
//  TimeComponents.swift
//  Meditation-App
//
//  Created by Palatip Jantawong on 17/10/2566 BE.
//

import SwiftUI

extension DateComponentsFormatter {
    static let positional: DateComponentsFormatter = {
        print("Innitailizing Time Components Formatter.positional")
        let  formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.minute,.second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter
    }()
}
