//
//  MyCalendar.swift
//  hourglass
//
//  Created by kingzcheung on 2021/11/29.
//

import Foundation


struct Month {
    var dateComponents: DateComponents
    

    public mutating func toDays() -> [Int] {
        
        var days =  [Int]()
        
        // 给定的日期中，1号是周几？
        let firstDayIdx = self.getMonthFirstDayIndex()
        // 获取当前月份有多少天
        let monthCount = Month.getCurentMonthDays(dateComponents: self.dateComponents)
        
        for _ in 0..<firstDayIdx {
            days += [0]
        }
        
        for i in 1 ..< monthCount {
            days += [i]
        }
        
        print(days)
        
        return days
    }
    
    func getMonthFirstDayIndex()->Int {
        var calendar = Calendar.current
        
        calendar.firstWeekday = 1
        let dcps: Set<Calendar.Component> = Set(arrayLiteral: Calendar.Component.year, Calendar.Component.month, Calendar.Component.day)
        var comps = calendar.dateComponents(dcps, from: calendar.date(from: self.dateComponents) ?? Date())
        comps.day = 1
        
        let date = calendar.date(from: comps) ?? Date()
        
        let firstDay = calendar.ordinality(of: .weekday, in: .weekOfMonth, for: date)! - 1
        
        return firstDay
    }
    
    
    func getCurentMonthDays()->Int {
        return Month.getCurentMonthDays(dateComponents: self.dateComponents)
    }
    
    static func getCurentMonthDays(dateComponents dc: DateComponents) -> Int {
        let calendar = Calendar.current
        let date = calendar.date(from: dc) ?? Date()
        let range = calendar.range(of: Calendar.Component.day, in: Calendar.Component.month, for: date)
        return range!.count
    }
}
