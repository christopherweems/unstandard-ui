//
//  Color+Extensions.swift
//  
//
//  Created by Christopher Weems on 10/21/21.
//

import SwiftUI

extension Color {
    @available(*, deprecated, renamed: "init(red:green:blue:opacity:)")
    public init(red: Double, green: Double, blue: Double, alpha: Double) {
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
    
}
