//
//  CGRect+Extensions.swift
//  
//
//  Created by Christopher Weems on 10/26/21.
//

import SwiftUI
import unstandard

extension CGRect {
    public static var unitRect: Self {
        .init(origin: .zero, size: .init(width: 1, height: 1))
    }
    
    public func position(of unitPoint: UnitPoint) -> CGPoint {
        CGPoint(unitPoint * size) + origin
    }
    
}
