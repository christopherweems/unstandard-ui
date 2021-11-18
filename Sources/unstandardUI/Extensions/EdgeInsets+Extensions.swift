//
//  EdgeInsets.swift
//  
//
//  Created by Christopher Weems on 10/21/21.
//

import SwiftUI
import Resultto

extension EdgeInsets {
    public static let zero = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    
}


// MARK: - Operators

extension EdgeInsets {
    public static func *(_ lhs: Self, _ rhs: Self) -> Self {
        EdgeInsets(top: lhs.top * rhs.top, leading: lhs.leading * rhs.leading, bottom: lhs.bottom * rhs.bottom, trailing: lhs.trailing * rhs.trailing)
    }
    
}


// MARK: - Offset

extension EdgeInsets {
    public func offset(at corner: UnitPoint) -> UnitPoint {
        switch corner {
        case .trailing:
            return .init(x: -trailing, y: 0)
            
        case .topTrailing:
            return .init(x: -trailing, y: top)
            
        case .top:
            return .init(x: 0, y: top)
            
        case .topLeading:
            return .init(x: leading, y: top)
            
        case .leading:
            return .init(x: leading, y: 0)
            
        case .bottomLeading:
            return .init(x: leading, y: -bottom)
            
        case .bottom:
            return .init(x: 0, y: -bottom)
            
        case .bottomTrailing:
            return .init(x: -trailing, y: -bottom)
            
        default:
            fatalError()
        }
    }
    
}

extension EdgeInsets {
    @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
    public func mirrored(across _: HorizontalEdge) -> EdgeInsets {
        return .init(top: top, leading: trailing, bottom: bottom, trailing: leading)
    }
    
}


// MARK: - Properties

extension EdgeInsets {
    @AnyTrue public var isNonZero: Bool {
        top != 0
        leading != 0
        trailing != 0
        bottom != 0
        
    }
    
}


// MARK: - Hashable conformance


extension EdgeInsets : Hashable {
    public func hash(into hasher: inout Hasher) {
        trailing.hash(into: &hasher)
        top.hash(into: &hasher)
        leading.hash(into: &hasher)
        bottom.hash(into: &hasher)
        
    }
    
}
