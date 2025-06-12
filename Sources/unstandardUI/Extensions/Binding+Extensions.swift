//
//  Binding+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/15/21.
//

import struct SwiftUI.Binding
import struct CoreGraphics.CGPoint
import struct CoreGraphics.CGFloat
@_exported import struct unstandard.Identified

extension Binding {
    public static func ??<T>(lhs: Self, rhs: T) -> Binding<T> where Value == Optional<T>, T : Sendable {
        .init(
            get: { lhs.wrappedValue ?? rhs },
            set: { lhs.wrappedValue = $0 }
        )
    }
    
}


// MARK: -

extension Binding {
    public func nonNil<WrappedValue : Sendable, Property>(
        _ propertyKeyPath: WritableKeyPath<WrappedValue, Property>
    ) -> Binding<Property?> where Value == Optional<WrappedValue> {
        nonisolated(unsafe) let _propertyKeyPath = propertyKeyPath
        
        return .init {
            self.wrappedValue?[keyPath: _propertyKeyPath]
        } set: { newValue in
            guard let newValue else { assertionFailure(); return }
            self.wrappedValue?[keyPath: _propertyKeyPath] = newValue
        }
    }
    
    public func forceUnwrapped<Wrapped : Sendable>() -> Binding<Wrapped> where Value == Optional<Wrapped> {
        .init {
            self.wrappedValue!
        } set: {
            self.wrappedValue = $0
        }
    }
    
}


// MARK: - Detour

extension Binding {
    public func detour(
        assignmentTo value: Value,
        with detourHandler: @escaping @Sendable (Value) -> Void,
    ) -> Self where Value : Equatable & Sendable {
        .init {
            self.wrappedValue
            
        } set: { newValue in
            switch newValue {
            case value:
                detourHandler(newValue)
                
            default:
                self.wrappedValue = newValue
                
            }
        }
    }
    
}



// MARK: - Binding<Bool>

extension Binding where Value == Bool {
    public prefix static func !(_ binding: Self) -> Bool {
        !binding.wrappedValue
    }
    
}


//

extension Binding {
    public init<Item : Sendable, ID : Sendable>(
        _ base: Binding<Item?>,
        id: KeyPath<Item, ID>,
    ) where Value == Identified<Item, ID>? {
        nonisolated(unsafe) let _id = id
        
        self.init {
            guard let wrappedValue = base.wrappedValue else { return nil }
            return Identified(item: wrappedValue, id: _id)
        } set: {
            base.wrappedValue = $0?.item
        }

    }
    
    public init<Item, ID : Sendable>(
        id: KeyPath<Item, ID>,
        get getter: @escaping @Sendable () -> Item?,
        set setter: @escaping @Sendable (Item?) -> Void,
    ) where Value == Identified<Item, ID>? {
        nonisolated(unsafe) let _id = id
        
        self.init {
            Identified(item: getter(), id: _id)
        } set: {
            setter($0?.item)
        }

    }
    
}
