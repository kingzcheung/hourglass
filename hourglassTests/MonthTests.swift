//
//  MyCalendar.swift
//  hourglassTests
//
//  Created by kingzcheung on 2021/11/29.
//

import XCTest

@testable import hourglass

class MonthTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var dc = DateComponents.init()
        dc.day = 2
        
        let month = Month(dateComponents: dc)
        print(month.toDays())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetCurentMonthDays () throws {
        
        var dc = DateComponents.init()
        dc.year = 2021
        dc.month = 2
        dc.day = 1
        dc.hour = 0
        dc.minute = 1
        dc.second = 1
        
        print(">>>>>>>>>>>>>>>>>")
        
        let count = Month.getCurentMonthDays(dateComponents: dc)
        print(count)
        XCTAssertEqual(28, count)
        
    }

}
