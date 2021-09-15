//
//  GeometryProxy+Extensions.swift
//
//
//  Created by Christopher Weems on 5/14/20.
//

import SwiftUI

extension GeometryProxy {
    public var maxSide: CGFloat {
        max(size.height, size.width)
    }
    
    public var minSide: CGFloat {
        min(size.height, size.width)
    }
    
}

extension GeometryProxy {
    public var nonInsetSize: CGSize {
        .init(width: size.width + safeAreaInsets.leading + safeAreaInsets.trailing,
              height: size.height + safeAreaInsets.top + safeAreaInsets.bottom)
    }
    
}
