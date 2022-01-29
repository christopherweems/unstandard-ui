//
//  CGSizeResult.swift
//  
//
//  Created by Christopher Weems on 1/28/22.
//

import CoreGraphics

@resultBuilder
public struct CGSizeResult {
    public static func buildBlock(_ size: CGSize) -> CGSize {
        size
    }
    
    public static func buildEither(first component: CGSize) -> CGSize {
        component
    }
    
    public static func buildEither(second component: CGSize) -> CGSize {
        component
    }
    
    public static func buildExpression(
        _ expression: (width: CGFloat, height: CGFloat)
    ) -> CGSize {
        .init(width: expression.width, height: expression.height)
    }
    
}
