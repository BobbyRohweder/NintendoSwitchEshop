//
//  NintendoSwitchEshopTests.swift
//

import XCTest

@testable import NintendoSwitchEshop

class NintendoSwitchEshopTests: XCTestCase {
    
    var eshopRestClient: FakeEshopRestClient!
    var nintendoSwitchEshop: NintendoSwitchEshop!
    
    override func setUp() {
        super.setUp()
        
        eshopRestClient = FakeEshopRestClient()
        nintendoSwitchEshop = NintendoSwitchEshop(eshopRestClient: eshopRestClient)
    }

    override func tearDown() {
        eshopRestClient = nil
        nintendoSwitchEshop = nil
        
        super.tearDown()
    }
    
    func testParsingFetchedResultsInAmerica() {
        var games = [GameUS]()
        let getExpectation = expectation(description: "getExpectation")
        nintendoSwitchEshop.getGamesInAmerica { returnedGames, error in
            games = returnedGames
            getExpectation.fulfill()
        }
        
        let fileUrl = Bundle(for: NintendoSwitchEshopTests.self).url(forResource: "AmericaGamesSampleJson", withExtension: "json")!
        let data = try! Data(contentsOf: fileUrl)
        let jsonObject = try! JSONSerialization.jsonObject(with: data, options: [])
        eshopRestClient.completionBlock!(jsonObject, nil)
        
        wait(for: [getExpectation], timeout: 10)
        
        // Note: Changed the game count to 200 so another request was not issued
        XCTAssertEqual(games.count, 200)
        
        // Check a game
        let game = games.first(where: { $0.slug == "1-2-switch" })!
        XCTAssertEqual(game.title, "1-2-Switch")
        XCTAssertEqual(game.eshopPrice, 49.99)
        
        // Check a second game
        let game2 = games.first(where: { $0.slug == "bayonetta-digital-version-switch" })!
        XCTAssertEqual(game2.title, "Bayonetta")
        XCTAssertEqual(game2.eshopPrice, 29.99)
    }
    
    func testParsingFetchedResultsInEurope() {
        var games = [GameEU]()
        let getExpectation = expectation(description: "getExpectation")
        nintendoSwitchEshop.getGamesInEurope { returnedGames, error in
            games = returnedGames
            getExpectation.fulfill()
        }
        
        let fileUrl = Bundle(for: NintendoSwitchEshopTests.self).url(forResource: "EuropeGamesSampleJson", withExtension: "json")!
        let data = try! Data(contentsOf: fileUrl)
        let jsonObject = try! JSONSerialization.jsonObject(with: data, options: [])
        eshopRestClient.completionBlock!(jsonObject, nil)
        
        wait(for: [getExpectation], timeout: 10)
        
        XCTAssertEqual(games.count, 1118)
        
        // Check a game
        let game = games.first(where: { $0.id == "1289908" })!
        XCTAssertEqual(game.title, "ACA NEOGEO THE KING OF FIGHTERS '95")
        XCTAssertEqual(game.prettyGameCategoriesTxt, ["Arcade", "Fighting"])
        
        // Check a second game
        let game2 = games.first(where: { $0.id == "1388641" })!
        XCTAssertEqual(game2.title, "Super Mario Party")
        XCTAssertEqual(game2.prettyGameCategoriesTxt, ["Board Game", "Party"])
    }
    
}
