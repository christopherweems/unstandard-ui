//
//  Path+Extensions.swift
//  
//
//  Created by Christopher Weems on 10/20/21.
//

import SwiftUI

extension Path {
    public mutating func move(to p: UnitPoint) {
        self.move(to: CGPoint(x: p.x, y: p.y))
    }
    
    public mutating func addLine(to p: UnitPoint) {
        self.addLine(to: CGPoint(x: p.x, y: p.y))
    }
    
    public mutating func addLines(_ lines: [UnitPoint]) {
        self.addLines(lines.map { CGPoint(x: $0.x, y: $0.y) })
    }
    
}


// MARK: - Upsizing Paths sized within a square unit

extension Path {
    public mutating func transform(scalingUnitPathTo frame: CGRect) {
        precondition(boundingRect.maxX <= 1 && boundingRect.maxY <= 1, "path must be smaller than (1,1)")
        self = self.applying(
                CGAffineTransform(scaleX: frame.width, y: frame.height)
                    .translatedBy(x: frame.origin.x, y: frame.origin.y)
            )
    }
    
    public mutating func transform(scalingUnitPathBy scale: CGFloat) {
        self = self.applying(CGAffineTransform(scaleX: scale, y: scale))
    }
    
    public func applying(transformScalingUnitPathTo frame: CGRect) -> Path {
        var new = self
        new.transform(scalingUnitPathTo: frame)
        return new
    }
    
    public func applying(transformScalingUnitPathBy scale: CGFloat) -> Path {
        var new = self
        new.transform(scalingUnitPathBy: scale)
        return new
    }
    
}
