//
//  BuildInfo.swift
//

import UIKit

class BuildInfo {
    
    static let isDebugBuild: Bool = hasDebugBuildFlag
    
}

// Build Flag Helpers
extension BuildInfo {
    
    private static var hasDebugBuildFlag: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
}
