//
//  FakeNetworkRequester.swift
//

import UIKit

@testable import NintendoSwitchEshop

class FakeNetworkRequester: NSObject, AnyNetworkRequester {
    
    var passedRequest: URLRequest?
    var completionBlock: ((Any?, Error?) -> Void)?
    
    func request(request: URLRequest, completion: @escaping (Any?, Error?) -> Void) {
        passedRequest = request
        completionBlock = completion
    }
    
}
