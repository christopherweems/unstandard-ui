//
//  CGAffineTransform+Extensions.swift
//  
//
//  Created by Christopher Weems on 10/22/21.
//

import CoreGraphics

extension CGAffineTransform {
    public static func scale(width: CGFloat, height: CGFloat) -> Self {
        .init(scaleX: width, y: height)
    }
    
}

extension CGAffineTransform {
    public static func scalingUnitRect(to frame: CGRect) -> CGAffineTransform {
        CGAffineTransform(scaleX: frame.width, y: frame.height)
            .translatedBy(x: frame.origin.x, y: frame.origin.y)
    }
    
}
