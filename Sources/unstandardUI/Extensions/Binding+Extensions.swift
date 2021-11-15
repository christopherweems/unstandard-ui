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
    public static func ??<T>(lhs: Self, rhs: T) -> Binding<T> where Value == Optional<T> {
        .init(
            get: { lhs.wrappedValue ?? rhs },
            set: { lhs.wrappedValue = $0 }
        )
    }
    
}

// MARK: - Detour

extension Binding {
    public func detour(assignmentTo value: Value,
                       with detourHandler: @escaping (Value) -> Void) -> Self where Value : Equatable {
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
    public init<Item, ID>(_ base: Binding<Item?>, id: KeyPath<Item, ID>) where Value == Identified<Item, ID>?, ID : Hashable {
        self.init {
            guard let wrappedValue = base.wrappedValue else { return nil }
            return Identified(item: wrappedValue, id: id)
        } set: {
            base.wrappedValue = $0?.item
        }

    }
    
    public init<Item, ID>(id: KeyPath<Item, ID>, get getter: @escaping () -> Item?, set setter: @escaping (Item?) -> Void) where Value == Identified<Item, ID>?, ID : Hashable {
        self.init {
            Identified(item: getter(), id: id)
        } set: {
            setter($0?.item)
        }

    }
    
}
