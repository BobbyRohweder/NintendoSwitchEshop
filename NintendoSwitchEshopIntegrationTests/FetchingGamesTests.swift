//
//  FetchingGamesTests.swift
//

import XCTest

@testable import NintendoSwitchEshop

class FetchingGamesTests: XCTestCase {
    
    var nintendoSwitchEshop: NintendoSwitchEshop!
    
    override func setUp() {
        super.setUp()
        
        nintendoSwitchEshop = NintendoSwitchEshop()
    }
    
    override func tearDown() {
        nintendoSwitchEshop = nil
        
        super.tearDown()
    }
    
    func testFetchingGamesInUS() {
        let gamesExpectation = expectation(description: "gamesExpectation")
        var gamesList = [GameUS]()
        
        nintendoSwitchEshop.getGamesInAmerica { games, error in
            gamesList = games
            gamesExpectation.fulfill()
        }
        
        wait(for: [gamesExpectation], timeout: 60)
        XCTAssertGreaterThan(gamesList.count, 1000)
    }
    
    func testFetchingGamesInEU() {
        let gamesExpectation = expectation(description: "gamesExpectation")
        var gamesList = [GameEU]()
        
        nintendoSwitchEshop.getGamesInEurope { games, error in
            gamesList = games
            gamesExpectation.fulfill()
        }
        
        wait(for: [gamesExpectation], timeout: 60)
        XCTAssertGreaterThan(gamesList.count, 1000)
    }
    
}
