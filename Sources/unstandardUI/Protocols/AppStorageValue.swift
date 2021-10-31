//
//  AppStorageValue.swift
//  
//
//  Created by Christopher Weems on 10/30/21.
//

import SwiftUI

public protocol AppStorageValue: RawRepresentable, CaseIterable {
    associatedtype RawValue
    static var storageKey: String { get }
    
}

extension AppStorageValue {
    public static var storageKey: String { "\(Self.self)" }
    
}

@available(macOS 11, iOS 14, tvOS 14, *)
extension AppStorage {
    public init(wrappedValue: Value, store: UserDefaults? = nil) where Value : AppStorageValue, Value.RawValue == String {
        self.init(wrappedValue: wrappedValue, Value.storageKey, store: store)
    }
    
}
