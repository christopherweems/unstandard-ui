//
//  _EndedGesture+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/17/21.
//

import SwiftUI

@available(tvOS, unavailable)
extension _EndedGesture where Content == TapGesture {
    public init() {
        self = TapGesture().onEnded { }
    }
    
}
