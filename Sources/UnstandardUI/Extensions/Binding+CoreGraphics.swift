//
//  Binding+CoreGraphics.swift
//
//
//  Created by Christopher Weems on 9/22/21.
//

import SwiftUI
import CoreGraphics

// MARK: - Binding<CGFloat>

extension Binding where Value == CGFloat? {
    public var isNil: Bool { wrappedValue == nil }
    
}


// MARK: - Binding<CGPoint>

extension Binding where Value == CGPoint {
    public var magnitude: CGFloat {
        self.wrappedValue.magnitude
    }
    
}

extension Binding where Value == CGPoint? {
    public var magnitude: CGFloat {
        self.wrappedValue?.magnitude ?? 0
    }
    
}

extension Binding where Value == CGPoint? {
    public var isNil: Bool { wrappedValue == nil }
    
}
