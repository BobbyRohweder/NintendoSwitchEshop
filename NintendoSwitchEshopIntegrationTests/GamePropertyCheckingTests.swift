//
//  GamePropertyCheckingTests.swift
//

import XCTest

@testable import NintendoSwitchEshop

class GamePropertyCheckingTests: XCTestCase {
    
    func testGameUSPropertiesAreUsed() {
        let getExpectation = expectation(description: "gamesExpectation")
        var jsonObject: Any?
        
        EshopRestClient().getGamesInAmerica(offset: 0) { json, error in
            XCTAssertNil(error)
            jsonObject = json
            getExpectation.fulfill()
        }
        wait(for: [getExpectation], timeout: 30)
        
        var gameParameters = [String: Int]()
        guard let json = jsonObject as? [String: Any],
            let responseJson = json["games"] as? [String: Any],
            let gamesListJson = responseJson["game"] as? [Any] else {
                return XCTFail()
        }
        
        for gameJson in gamesListJson {
            if let game = gameJson as? [String: Any] {
                for key in game.keys {
                    gameParameters[key] = (gameParameters[key] ?? 0) + 1
                }
            }
        }
        
        for currentKey in GameUS.ParseKey.allCases {
            XCTAssertGreaterThan(gameParameters[currentKey.rawValue] ?? 0, 0, "\(currentKey) not greated than 0")
            gameParameters.removeValue(forKey: currentKey.rawValue)
        }
        
        // Keys that are not added to the model
        let ignoredKeys: [String] = [] // None right now
        for key in ignoredKeys {
            gameParameters.removeValue(forKey: key)
        }
        
        XCTAssertEqual(gameParameters.keys.count, 0, "Unused keys: \(gameParameters.keys)")
    }
    
    func testGameEUPropertiesAreUsed() {
        let getExpectation = expectation(description: "gamesExpectation")
        var jsonObject: Any?
        
        EshopRestClient().getGamesInEurope { json, error in
            XCTAssertNil(error)
            jsonObject = json
            getExpectation.fulfill()
        }
        wait(for: [getExpectation], timeout: 30)
        
        var gameParameters = [String: Int]()
        guard let json = jsonObject as? [String: Any],
            let responseJson = json["response"] as? [String: Any],
            let gamesListJson = responseJson["docs"] as? [Any] else {
                return XCTFail()
        }
        
        for gameJson in gamesListJson {
            if let game = gameJson as? [String: Any] {
                for key in game.keys {
                    gameParameters[key] = (gameParameters[key] ?? 0) + 1
                }
            }
        }
        
        for currentKey in GameEU.ParseKey.allCases {
            XCTAssertGreaterThan(gameParameters[currentKey.rawValue] ?? 0, 0, "\(currentKey) not greated than 0")
            gameParameters.removeValue(forKey: currentKey.rawValue)
        }
        
        // Keys that are not added to the model
        let ignoredKeys: [String] = [
            "datasize_readable_txt", // For DS - 1 result
            "download_play", // No usage - 1 result
            "ir_motion_camera_b", // Only returned in for 1-2-Switch - 1 result
            "mii_support", // Depricated - 2 results
            "pg_s", // Any usage? - Same as type?
            "play_coins", // No usage - 1 result
            "ranking_b", // Any usage? - 7 results
            "reg_only_hidden", // Any usage?
            "voice_chat_b", // Only Splatoon? - Check again later
            "_version_" // Any usage?
        ]
        for key in ignoredKeys {
            gameParameters.removeValue(forKey: key)
        }
        
        XCTAssertEqual(gameParameters.keys.count, 0, "Unused keys: \(gameParameters.keys)")
    }
    
}
