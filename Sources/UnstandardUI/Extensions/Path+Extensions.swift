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
