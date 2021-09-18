//
//  LongPressGestureConfiguration.swift
//  
//
//  Created by Christopher Weems on 9/18/21.
//

import SwiftUI

public struct LongPressGestureConfiguration {
    let minimumDuration: Double
    let maximumDistance: CGFloat
    let action: () -> Void
    let onPressingChanged: ((Bool) -> Void)?
    
    public init(minimumDuration: Double = 0.5, maximumDistance: CGFloat = 10, action: @escaping () -> Void, onPressingChanged: ((Bool) -> Void)? = nil) {
        self.minimumDuration = minimumDuration
        self.maximumDistance = maximumDistance
        self.action = action
        self.onPressingChanged = onPressingChanged
        
    }
    
    public init() {
        self.init(action: { })
        
    }
    
}
