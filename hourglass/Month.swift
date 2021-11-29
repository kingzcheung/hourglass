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
    
    static func getCurentMonthDays() -> Int {
        let calendar = self.dateComponents
        let range = calendar.range(of: Calendar.Component.day, in: Calendar.Component.month, for: Date())
        return range!.count
    }
}
