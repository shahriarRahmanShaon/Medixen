//
//  Extensions.swift
//  Medixen
//
//  Created by sergio shaon on 18/2/22.
//

import Foundation

extension DateComponentsFormatter{
    var timeInMinuteAndSecondsOnly: DateComponentsFormatter{
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }
}
