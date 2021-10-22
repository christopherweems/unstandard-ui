//
//  AnyGesture+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/17/21.
//

import SwiftUI


// MARK: - Type Erasure

extension Gesture {
    public func eraseToAnyGesture() -> AnyGesture<Value> {
        .init(self)
    }
    
}
