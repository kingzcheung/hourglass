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
    
}
