//
//  Binding+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/15/21.
//

import struct SwiftUI.Binding
import struct CoreGraphics.CGPoint
import struct CoreGraphics.CGFloat

extension Binding {
    public static func ??<T>(lhs: Self, rhs: T) -> Binding<T> where Value == Optional<T> {
        Binding<T>(
            get: { lhs.wrappedValue ?? rhs },
            set: { lhs.wrappedValue = $0 }
        )
    }
    
}


// MARK: - Binding<Bool>

extension Binding where Value == Bool {
    public prefix static func !(_ binding: Self) -> Bool {
        !binding.wrappedValue
    }
    
}
