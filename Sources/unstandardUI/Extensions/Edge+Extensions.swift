//
//  Edge+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/14/22.
//

import SwiftUI

extension Edge {
    public init(oppositeOf otherEdge: Edge) {
        switch otherEdge {
        case .top:
            self = .bottom
            
        case .leading:
            self = .trailing
            
        case .bottom:
            self = .top
            
        case .trailing:
            self = .leading
        }
    }
    
}
