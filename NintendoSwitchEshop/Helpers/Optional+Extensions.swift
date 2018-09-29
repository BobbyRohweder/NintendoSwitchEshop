//
//  Optional+Extensions.swift
//

import Foundation

extension Optional {
    
    /// Used to notify us if an assumption is incorrect
    /// For example if we expect a json value to always be non optional
    var expectedInt: Int {
        if BuildInfo.isDebugBuild {
            return self as! Int
        }
        return self as? Int ?? 0
    }
    
    /// Used to notify us if an assumption is incorrect
    /// For example if we expect a json value to always be non optional
    var expectedDouble: Double {
        if BuildInfo.isDebugBuild {
            return self as! Double
        }
        return self as? Double ?? 0
    }
    
    /// Used to notify us if an assumption is incorrect
    /// For example if we expect a json value to always be non optional
    var expectedBool: Bool {
        if BuildInfo.isDebugBuild {
            return self as! Bool
        }
        return self as? Bool ?? false
    }
    
    /// Used to notify us if an assumption is incorrect
    /// For example if we expect a json value to always be non optional
    var expectedString: String {
        if BuildInfo.isDebugBuild {
            return self as! String
        }
        return self as? String ?? ""
    }
    
    /// Used to notify us if an assumption is incorrect
    /// For example if we expect a json value to always be non optional
    var expectedStringArray: [String] {
        if BuildInfo.isDebugBuild {
            return self as! [String]
        }
        return self as? [String] ?? [String]()
    }
    
}
