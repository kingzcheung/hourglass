//
//  MyCalendar.swift
//  hourglass
//
//  Created by kingzcheung on 2021/11/29.
//

import Foundation


struct Month {
    var dateComponents: DateComponents
    

    public func toDays() -> [Int] {
        return [
            1,2,3,4
        ]
    }
    
    static func getCurentMonthDays(dateComponents dc: DateComponents) -> Int {
        let calendar = Calendar.current
        let date = calendar.date(from: dc) ?? Date()
        let range = calendar.range(of: Calendar.Component.day, in: Calendar.Component.month, for: date)
        return range!.count
    }
}
