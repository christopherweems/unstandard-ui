//
//  Binding+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/15/21.
//

import struct SwiftUI.Binding
import struct CoreGraphics.CGPoint
import struct CoreGraphics.CGFloat


// MARK: - Binding<Bool>

extension Binding where Value == Bool {
    public prefix static func !(_ binding: Self) -> Bool {
        !binding.wrappedValue
    }
    
}


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
