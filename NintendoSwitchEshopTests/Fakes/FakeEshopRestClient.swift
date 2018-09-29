//
//  FakeEshopRestClient.swift
//

import UIKit

@testable import NintendoSwitchEshop

class FakeEshopRestClient: NSObject, AnyEshopRestClient {
    
    var passedOffset: Int?
    var completionBlock: ((Any?, Error?) -> Void)?
    
    func getGamesInAmerica(offset: Int, completion: @escaping (Any?, Error?) -> Void) {
        passedOffset = offset
        completionBlock = completion
    }
    
    func getGamesInEurope(completion: @escaping (Any?, Error?) -> Void) {
        completionBlock = completion
    }
    
}
