//
//  GraphicsContext.ResolvedText+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/12/21.
//

import SwiftUI

@available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
extension GraphicsContext.ResolvedText {
    public var size: CGSize {
        self.measure(in: .infinite)
    }
    
}

