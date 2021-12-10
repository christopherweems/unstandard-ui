//
//  StrokeStyle+Extensions.swift
//  
//
//  Created by Christopher Weems on 12/10/21.
//

import SwiftUI

extension StrokeStyle {
    public func dividing(lineWidthBy lineWidthDivider: CGFloat) -> StrokeStyle {
        var new = self
        new.lineWidth /= lineWidthDivider
        return new
    }
    
}
