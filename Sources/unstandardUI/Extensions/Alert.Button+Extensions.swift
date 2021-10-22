//
//  Alert.Button+Extensions.swift
//
//
//  Created by Christopher Weems on 9/21/21.
//

import SwiftUI

extension Alert.Button {
    public static func `default`<S>(_ labelText: S, action: (() -> Void)? = {}) -> Alert.Button where S : StringProtocol {
        self.destructive(Text(labelText))
    }
    
    public static func cancel<S>(_ labelText: S, action: (() -> Void)? = {}) -> Alert.Button where S : StringProtocol {
        self.cancel(Text(labelText))
    }
    
    public static func destructive<S>(_ labelText: S, action: (() -> Void)? = {}) -> Alert.Button where S : StringProtocol {
        self.destructive(Text(labelText))
    }
    
}
