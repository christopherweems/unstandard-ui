//
//  ColorScheme+Extensions.swift
//  
//
//  Created by Christopher Weems on 1/30/22.
//

import SwiftUI

extension ColorScheme: @retroactive RawRepresentable {
    public var rawValue: String {
        switch self {
        case .light:
            return "light"
            
        case .dark, _:
            return "dark"
            
        }
    }
    
    public init?(rawValue: String) {
        switch rawValue {
        case "dark":
            self = .dark
            
        case "light":
            self = .light
            
        default:
            return nil
            
        }
    }
    
}


// MARK: - Toggle

extension ColorScheme {
    public mutating func _toggle() {
        switch self {
        case .dark:
            self = .light
            
        case .light, _:
            self = .dark
            
        }
    }
    
}
