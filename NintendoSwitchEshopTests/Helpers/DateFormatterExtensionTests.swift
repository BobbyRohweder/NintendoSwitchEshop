//
//  DateFormatterExtensionTests.swift
//

import XCTest

@testable import NintendoSwitchEshop

class DateFormatterExtensionTests: NSObject {
    
    func testIso8601() {
        let dateFormatter = DateFormatter.iso8601
        
        XCTAssertNil(dateFormatter.date(from: ""))
        XCTAssertNil(dateFormatter.date(from: "Hello"))
        XCTAssertNil(dateFormatter.date(from: "2017-11-17"))
        
        XCTAssertEqual(dateFormatter.date(from: "2017-11-17T00:00:00Z"), Date(timeIntervalSince1970: 1510876800))
        XCTAssertEqual(dateFormatter.date(from: "2018-01-15T15:20:24Z"), Date(timeIntervalSince1970: 1516029624))
    }
    
}
