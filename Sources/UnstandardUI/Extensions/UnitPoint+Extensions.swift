//
//  UnitPoint+Extensions.swift
//  
//
//  Created by Christopher Weems on 10/20/21.
//

import SwiftUI

extension UnitPoint {
    public static func +(_ lhs: Self, _ rhs: Self) -> Self {
        .init(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    public static func -(_ lhs: Self, _ rhs: Self) -> Self {
        .init(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
}
