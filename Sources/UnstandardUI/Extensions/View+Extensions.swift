//
//  View+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/15/21.
//

import SwiftUI

extension View {
    public func eraseToAnyView() -> AnyView {
        .init(self)
    }
    
}
