//
//  Image+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/20/21.
//

import SwiftUI

extension Image {
    public enum Name {
        case system(name: String)
        case asset(name: String)
        
    }
    
    public init(named: Name) {
        switch named {
        case let .system(name):
            self.init(systemName: name)
            
        case let .asset(name):
            self.init(name)
            
        }
    }
    
}
