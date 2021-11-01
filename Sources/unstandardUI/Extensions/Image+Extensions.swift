//
//  Image+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/20/21.
//

import SwiftUI

@available(macOS 11.0, *)
extension Image {
    public enum Name {
        case system(name: String)
        case asset(name: String)
        
    }
    
    public init(named: Name, bundle: Bundle? = nil) {
        switch named {
        case let .system(name):
            self.init(systemName: name)
            
        case let .asset(name):
            self.init(name, bundle: bundle)
            
        }
    }
    
}
