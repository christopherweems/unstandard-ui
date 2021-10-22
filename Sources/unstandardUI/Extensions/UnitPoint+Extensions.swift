//
//  UnitPoint+Extensions.swift
//  
//
//  Created by Christopher Weems on 10/20/21.
//

import SwiftUI

extension UnitPoint {
    public typealias Unit = CGFloat
    
}

extension UnitPoint {
    public static func +(_ lhs: Self, _ rhs: Self) -> Self {
        .init(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    public static func -(_ lhs: Self, _ rhs: Self) -> Self {
        .init(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
}

extension UnitPoint {
    public static func *(multiplier: UnitPoint.Unit, point: UnitPoint) -> UnitPoint {
        precondition((-1...1).contains(multiplier), "UnitPoint multiplier must be within (-1...1)")
        return .init(x: point.x * multiplier, y: point.y * multiplier)
    }
    
    public static func *(point: UnitPoint, multiplier: UnitPoint.Unit) -> UnitPoint {
        return multiplier * point
    }
    
}

extension UnitPoint {
    public var normalized: Self {
        guard length != 0 else { return .zero }
        let scale = 1 / length
        return .init(x: x * scale, y: y * scale)
    }
    
    public var length: UnitPoint.Unit {
        sqrt(x * x + y * y)
    }
    
}
