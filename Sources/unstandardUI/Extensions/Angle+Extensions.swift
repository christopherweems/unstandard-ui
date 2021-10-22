//
//  Angle+Extensions.swift
//
//
//  Created by Christopher Weems on 5/20/20.
//

import struct SwiftUI.Angle
import unstandard

extension Angle {
    public func rounded(increments: Angle) -> Angle {
        let increments = increments.radians
        assert(increments < .tau)
        return .init(radians: (radians / increments).rounded() * increments)
    }
    
}
