//
//  CGSize+Dimension.swift
//  
//
//  Created by Christopher Weems on 12/1/21.
//

import SwiftUI
import Resultto

extension CGSize {
    public typealias Dimension = KeyPath<Self, CGFloat>
    
}

extension Collection where Element == CGSize.Dimension {
    public var edges: Set<Edge> {
        Set(self.flatMap { dimension -> [Edge] in
            switch dimension {
            case \.width:
                return [.leading, .trailing]
                
            case \.height:
                return [.top, .bottom]
                
            default:
                return []
                
            }
        })
    }
    
    public var axes: Set<Axis> {
        Set(self.flatMap { dimension -> [Axis] in
            switch dimension {
            case \.width:
                return [.horizontal]
                
            case \.height:
                return [.vertical]
                
            default:
                return []
                
            }
        })
    }
    
}

extension Collection where Element == Axis {
    @SingleResult
    public func contains(_ dimension: CGSize.Dimension) -> Bool {
        switch dimension {
        case \.width:
            self.contains(.horizontal)
            
        case \.height:
            self.contains(.vertical)
            
        default:
            false
        }
    }
    
}
