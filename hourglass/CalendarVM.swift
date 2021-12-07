//
//  CalendarVM.swift
//  hourglass
//
//  Created by kingzcheung on 2021/12/6.
//

import Foundation
import Combine

final class CalendarVM: ObservableObject {
    @Published var year = 2020
    @Published var month = 1
    @Published var day = 1
    
    init() {
        let dc = Calendar.current.dateComponents([.year,.month,.day], from: Date())
        self.year = dc.year ?? 2020
        self.month = dc.month ?? 1
        self.day = dc.day ?? 1
    }
    
    init(year: Int,month:Int,day:Int) {
        self.year = year
        self.month = month
        self.day = day
        
    }
    
    func fromDateComponents() ->DateComponents {
        var dc = DateComponents()
        dc.year = self.year
        dc.month = self.month
        dc.day = self.day
        
        return dc
    }
    
    
    func addMonth(_ step: Int) {
        self.month += step
        if self.month > 12 {
            self.year += 1
            self.month = self.month - 12
        }
        
    }
    
    func subMonth(_ step: Int) {
        self.month -= step
        if self.month < 1 {
            self.year -= 1
            self.month = 12 + self.month
        }
    }
    
    func days()->[Int] {
        let dc = self.fromDateComponents()
        var month = Month.init(dateComponents: dc)
        return month.toDays()
    }
    func toDate()->String {
        let df = DateFormatter.init()
        let dc = self.fromDateComponents()
        df.dateFormat = "yyyy年MM月dd日"
        let calendar = Calendar.current
        let date = calendar.date(from: dc)
        return df.string(from: date!)
    }
}
