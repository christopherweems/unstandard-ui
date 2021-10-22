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
    private(set) var action: () -> Void
    private(set) var onPressingChanged: ((Bool) -> Void)?
    
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

extension LongPressGestureConfiguration {
    /// schedule an action to occur before the original gesture action is performed
    public func action(prepend prependedAction: @escaping () -> Void) -> Self {
        var new = self
        new.action = { prependedAction(); action() }
        return new
    }
    
    public func onPressingChange(prepend prependAction: @escaping (Bool) -> Void) -> Self {
        var new = self
        
        if let existingAction = onPressingChanged {
            new.onPressingChanged = { isPressed in
                prependAction(isPressed)
                existingAction(isPressed)
                
            }
            
        } else {
            new.onPressingChanged = prependAction
            
        }
        
        return new
    }
        
}
