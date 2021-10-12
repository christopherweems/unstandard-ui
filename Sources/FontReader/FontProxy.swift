//
//  FontProxy.swift
//
//
//  Created by Christopher Weems on 10/12/21.
//

import SwiftUI

public struct FontProxy {
    public private(set) var font: Font?
    
    internal init(font: Font?) {
        self.font = font
        
    }
    
}

//extension FontProxy {
//    public func `is`(ofWeight weight: Font.Weight) -> Bool {
//        guard let font = font else { return weight == .regular }
//        return font.weight(weight) == font
//    }
//
//}
