//
//  Axis+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/17/21.
//

import SwiftUI

extension Axis {
    public init(perpendicularTo other: Axis) {
        self = other.perpendicular
        
    }
    
}

extension Axis {
    internal var perpendicular: Axis {
        switch self {
        case .horizontal:
            return .vertical
            
        case .vertical:
            return .horizontal
        }
    }
    
}
