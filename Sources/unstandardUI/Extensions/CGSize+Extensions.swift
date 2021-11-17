//
//  CGSize+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/12/21.
//

import SwiftUI


// MARK: -

extension CGSize {
    public static var infinite: CGSize {
        .init(width: CGFloat.infinity, height: CGFloat.infinity)
    }
    
}


// MARK: -

extension CGSize {
    public func length(along axis: Axis) -> CGFloat {
        switch axis {
        case .horizontal:
            return width
            
        case .vertical:
            return height
        }
    }
}
