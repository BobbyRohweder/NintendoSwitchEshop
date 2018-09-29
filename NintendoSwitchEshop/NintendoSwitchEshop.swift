//
//  NintendoSwitchEshop.swift
//

import UIKit

public enum Region: String {
    case america = "AMERICAS"
    case europe = "EUROPE"
    case asia = "ASIA"
}

enum NintendoSwitchEshopError: Error {
    case parse
}

public class NintendoSwitchEshop: NSObject {
    
    let eshopRestClient: AnyEshopRestClient
    
    public override convenience init() {
        let eshopRestClient = EshopRestClient(networkRequester: NetworkRequester())
        self.init(eshopRestClient: eshopRestClient)
    }
    
    init(eshopRestClient: AnyEshopRestClient) {
        self.eshopRestClient = eshopRestClient
    }
    
    public func getGamesInAmerica(completion: @escaping ([GameUS], Error?) -> Void) {
        getGamesInAmericaHelper(offset: 0, previousGames: [], expectedGameCount: 400, completion: completion)
    }
    
    private func getGamesInAmericaHelper(offset: Int, previousGames: [GameUS], expectedGameCount: Int, completion: @escaping ([GameUS], Error?) -> Void) {
        eshopRestClient.getGamesInAmerica(offset: offset) { [weak self] jsonObject, error in
            guard error == nil else {
                return completion([], error)
            }
            
            guard let json = jsonObject as? [String: Any],
                let gamesJson = json["games"] as? [String: Any],
                let gamesListJson = gamesJson["game"] as? [Any] else {
                    return completion([], NintendoSwitchEshopError.parse)
            }
            
            var games = previousGames
            for gameJson in gamesListJson {
                if let game = GameUS(jsonObject: gameJson) {
                    games.append(game)
                }
            }
            
            let gameCount = (json["filter"] as? [String: Any])?["total"] as? Int ?? expectedGameCount
            
            let nextOffset = offset + gamesListJson.count
            if nextOffset < gameCount {
                self?.getGamesInAmericaHelper(offset: nextOffset, previousGames: games, expectedGameCount: gameCount, completion: completion)
            } else {
                completion(games, nil)
            }
        }
    }
    
    public func getGamesInEurope(completion: @escaping ([GameEU], Error?) -> Void) {
        eshopRestClient.getGamesInEurope { jsonObject, error in
            guard error == nil else {
                return completion([], error)
            }
            
            guard let json = jsonObject as? [String: Any],
                let responseJson = json["response"] as? [String: Any],
                let gamesListJson = responseJson["docs"] as? [Any] else {
                    return completion([], NintendoSwitchEshopError.parse)
            }
            
            var games = [GameEU]()
            for gameJson in gamesListJson {
                if let game = GameEU(jsonObject: gameJson) {
                    games.append(game)
                }
            }
            completion(games, nil)
        }
    }
    
}
