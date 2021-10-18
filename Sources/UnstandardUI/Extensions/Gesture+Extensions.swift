//
//  Gesture+Extensions.swift
//
//
//  Created by Christopher Weems on 10/18/21.
//

import protocol SwiftUI.Gesture

extension Gesture {
    public func sequenced<G: Gesture>(after preceding: G) -> some Gesture {
        preceding.sequenced(before: self)
    }
    
}
