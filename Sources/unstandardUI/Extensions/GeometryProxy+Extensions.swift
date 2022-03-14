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

extension GeometryProxy {
    public func frame(_in coordinateSpace: CoordinateSpace, ignoringSafeAreaInsets: Bool) -> CGRect {
        var frame = self.frame(in: coordinateSpace)
        guard !ignoringSafeAreaInsets else { return frame }
        
        frame.origin.x += self.safeAreaInsets.leading
        frame.origin.y += self.safeAreaInsets.top
        frame.size = self.nonInsetSize
        
        return frame
    }
    
}

extension GeometryProxy {
    /// Only reliable for a view spanning the entire window.
    public var _isHomeButtonDevice: Bool {
        safeAreaInsets.bottom == 0
    }
    
}
