//
//  TextAlignment+Extensions.swift
//  
//
//  Created by Christopher Weems on 10/26/21.
//

import SwiftUI

extension TextAlignment {
    @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
    public func offsetDistance(from edge: HorizontalEdge) -> CGFloat {
        switch (edge, self) {
        case (.leading, .leading):
            return 0
            
        case (.leading, .center):
            return 0.5
            
        case (.leading, .trailing):
            return 1.0
            
        case (.trailing, .leading):
            return -1.0
            
        case (.trailing, .center):
            return -0.5
            
        case (.trailing, .trailing):
            return 0.0
        }
    }
    
    @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
    public func along(_ verticalEdge: VerticalEdge) -> UnitPoint {
        switch (verticalEdge, self) {
        case (.top, .leading):
            return .topLeading
            
        case (.top, .center):
            return .top
            
        case (.top, .trailing):
            return .topTrailing
            
        case (.bottom, .leading):
            return .bottomLeading
            
        case (.bottom, .center):
            return .bottom
            
        case (.bottom, .trailing):
            return .bottomTrailing
            
        }
    }
    
}
