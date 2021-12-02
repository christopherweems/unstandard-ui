//
//  ViewConfigurable.swift
//  
//
//  Created by Christopher Weems on 12/2/21.
//

import SwiftUI

// MARK: - ViewConfigurable
//
// A marker property wrapper used to indicate a view's
// internal values that can be set via property methods
// such as `(some View).foregroundColor(_:)`

@propertyWrapper
public struct ViewConfigurable<Value> {
    public var wrappedValue: Value
    
    public init(wrappedValue value: Value) {
        wrappedValue = value
        
    }
    
}

