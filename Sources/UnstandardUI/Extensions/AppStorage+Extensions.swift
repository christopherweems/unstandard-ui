//
//  AppStorage+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/19/21.
//

import SwiftUI

@available(macOS 11, iOS 14, tvOS 14, *)
extension AppStorage {
    public init<Key>(wrappedValue: Value, _ key: Key, store: UserDefaults? = nil) where Value == Bool, Key : RawRepresentable, Key.RawValue == String {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
    
}
