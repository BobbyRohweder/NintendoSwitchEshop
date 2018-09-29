//
//  NetworkRequester.swift
//

import UIKit

enum NetworkRequesterError: Error {
    case error
}

class NetworkRequester {
    
    static func request(request: URLRequest, completion: @escaping (Any?, Error?) -> Void) {
        let task = URLSession(configuration: .default).dataTask(with: request) { data, response, error in
            do {
                guard let data = data else { return completion(nil, NetworkRequesterError.error) }
                
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                completion(jsonObject, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
}
