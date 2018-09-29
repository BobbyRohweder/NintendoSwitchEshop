//
//  EshopRestClientTests.swift
//

import XCTest

@testable import NintendoSwitchEshop

class EshopRestClientTests: XCTestCase {
    
    var eshopRestClient: EshopRestClient!
    
    var networkRequester: FakeNetworkRequester!
    
    override func setUp() {
        super.setUp()
        
        networkRequester = FakeNetworkRequester()
        eshopRestClient = EshopRestClient(networkRequester: networkRequester)
    }
    
    override func tearDown() {
        networkRequester = nil
        eshopRestClient = nil
        
        super.tearDown()
    }
    
    func testGetGamesInAmerica() {
        let getExpectation = expectation(description: "getExpectation")
        eshopRestClient.getGamesInAmerica(offset: 0) { json, error in
            getExpectation.fulfill()
        }
        XCTAssertNotNil(networkRequester.passedRequest)
        XCTAssertTrue(networkRequester.passedRequest!.url!.absoluteString.contains("www.nintendo.com/json/content/get/filter/game"))
        XCTAssertEqual(networkRequester.passedRequest!.httpMethod, "GET")
        networkRequester.completionBlock!([], nil)
        
        wait(for: [getExpectation], timeout: 2)
    }
    
    func testGetGamesInEurope() {
        let getExpectation = expectation(description: "getExpectation")
        eshopRestClient.getGamesInEurope() { json, error in
            getExpectation.fulfill()
        }
        XCTAssertNotNil(networkRequester.passedRequest)
        XCTAssertTrue(networkRequester.passedRequest!.url!.absoluteString.contains("search.nintendo-europe.com"))
        XCTAssertEqual(networkRequester.passedRequest!.httpMethod, "GET")
        networkRequester.completionBlock!([], nil)
        
        wait(for: [getExpectation], timeout: 2)
    }
    
}
