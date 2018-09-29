//
//  EshopRestClient.swift
//

import UIKit

protocol AnyEshopRestClient {
    func getGamesInAmerica(offset: Int, completion: @escaping (Any?, Error?) -> Void)
    func getGamesInEurope(completion: @escaping (Any?, Error?) -> Void)
}

class EshopRestClient: NSObject, AnyEshopRestClient {
    
    private struct Constants {
        static let getGamesUSUrl = "https://www.nintendo.com/json/content/get/filter/game"
        static let getGamesEUUrl = "https://search.nintendo-europe.com/{locale}/select"
    }
    
    private let networkRequester: AnyNetworkRequester
    
    init(networkRequester: AnyNetworkRequester) {
        self.networkRequester = networkRequester
    }
    
    func getGamesInAmerica(offset: Int, completion: @escaping (Any?, Error?) -> Void) {
        var components = URLComponents(string: Constants.getGamesUSUrl)
        components?.queryItems = [
            URLQueryItem(name: "system", value: "switch"),
            URLQueryItem(name: "sort", value: "title"),
            URLQueryItem(name: "direction", value: "asc"),
            URLQueryItem(name: "offset", value: String(offset)),
            URLQueryItem(name: "limit", value: "9999")
        ]
        
        guard let url = components?.url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        print("Requesting US Games")
        networkRequester.request(request: request) { jsonObject, error in
            completion(jsonObject, error)
        }
    }
        
    func getGamesInEurope(completion: @escaping (Any?, Error?) -> Void) {
        let baseUrl = Constants.getGamesEUUrl.replacingOccurrences(of: "{locale}", with: "en")
        var components = URLComponents(string: baseUrl)
        components?.queryItems = [
            URLQueryItem(name: "fq", value: "type:GAME AND system_type:nintendoswitch*"),
            URLQueryItem(name: "q", value: "*"),
            URLQueryItem(name: "rows", value: "9999"),
            URLQueryItem(name: "sort", value: "sorting_title asc"),
            URLQueryItem(name: "start", value: "0"),
            URLQueryItem(name: "wt", value: "json")
        ]
        
        guard let url = components?.url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        print("Requesting EU Games")
        networkRequester.request(request: request) { jsonObject, error in
            completion(jsonObject, nil)
        }
    }
    
}
