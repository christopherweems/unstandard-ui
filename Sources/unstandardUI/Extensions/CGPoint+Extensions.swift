//
//  CGPoint+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/12/21.
//

import CoreGraphics

extension CGPoint {
    public init(centerOf size: CGSize) {
        self = .init(x: size.width / 2, y: size.height / 2)
        
    }
    
}
