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
    public static func +=(lhs: inout Self, rhs: Self) {
        lhs = lhs + rhs
    }
    
    public static func +(_ lhs: Self, _ rhs: Self) -> Self {
        .init(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    public static func -(_ lhs: Self, _ rhs: Self) -> Self {
        .init(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
}

extension UnitPoint {
    public static func +(lhs: UnitPoint, rhs: CGPoint) -> UnitPoint {
        lhs + UnitPoint(rhs)
    }
    
    public static func +(lhs: UnitPoint, rhs: CGSize) -> UnitPoint {
        lhs + UnitPoint(rhs)
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
    @_disfavoredOverload
    public static func *(lhs: Self, rhs: CGFloat) -> CGPoint {
        .init(x: lhs.x * rhs, y: lhs.y * rhs)
    }
    
    @_disfavoredOverload
    public static func *(lhs: Self, rhs: CGFloat) -> CGSize {
        .init(width: lhs.x * rhs, height: lhs.y * rhs)
    }
    
    public static func *(_ point: UnitPoint, size: CGSize) -> CGSize {
        .init(width: point.x * size.width, height: point.y * size.height)
    }
    
    public static func *(_ size: CGSize, point: UnitPoint) -> CGSize {
        point * size
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

extension UnitPoint {
    public init(horizontalAlignment: HorizontalAlignment, verticalAlignment: VerticalAlignment) {
        self.init(alignment: .init(horizontal: horizontalAlignment, vertical: verticalAlignment))
    }
    
    public init(alignment: Alignment) {
        switch alignment {
        case .trailing:
            self = .trailing
            
        case .topTrailing:
            self = .topTrailing
            
        case .top:
            self = .top
            
        case .topLeading:
            self = .topLeading
            
        case .leading:
            self = .leading
            
        case .bottomLeading:
            self = .bottomLeading
            
        case .bottom:
            self = .bottom
            
        case .bottomTrailing:
            self = .bottomTrailing
            
        default:
            fatalError("Unknown alignment: \(alignment)")
        }
    }
    
}

extension UnitPoint {
    public init(_ point: CGPoint) {
        self.init(x: point.x, y: point.y)
    }
    
    public init(_ size: CGSize) {
        self.init(x: size.width, y: size.height)
    }
    
}
