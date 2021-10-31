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

extension AppStorageValue where Self : Equatable {
    public typealias Options = AppStorageValueOptions<Self>
    
}

public struct AppStorageValueOptions<Value> where Value : AppStorageValue, Value : Equatable {
    private var allCases: Value.AllCases { Value.allCases }
    private var index = Value.allCases.startIndex
    
    public mutating func next() -> Value? {
        var nextIndex = allCases.index(after: index)
        if nextIndex == allCases.endIndex { nextIndex = allCases.startIndex }
        index = nextIndex
        return allCases[index]
    }
    
    public init() { }
    
    public init(startingAt item: Value?) {
        if let item = item {
            index = Value.allCases.firstIndex(of: item)!
            
        }
        
    }
}


// MARK: -

@available(macOS 11, iOS 14, tvOS 14, *)
extension AppStorage {
    public init(wrappedValue: Value, store: UserDefaults? = nil) where Value : AppStorageValue, Value.RawValue == String {
        self.init(wrappedValue: wrappedValue, Value.storageKey, store: store)
    }
    
}
