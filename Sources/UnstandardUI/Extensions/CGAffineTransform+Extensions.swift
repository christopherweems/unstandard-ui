//
//  CGAffineTransform+Extensions.swift
//  
//
//  Created by Christopher Weems on 10/22/21.
//

import struct CoreGraphics.CGAffineTransform
import struct CoreGraphics.CGRect

extension CGAffineTransform {
    public static func scalingUnitRect(to frame: CGRect) -> CGAffineTransform {
        CGAffineTransform(scaleX: frame.width, y: frame.height)
            .translatedBy(x: frame.origin.x, y: frame.origin.y)
    }
    
}
