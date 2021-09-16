//
//  View+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/15/21.
//

import SwiftUI

// MARK: - Asynchronous updates triggered by changes of geometry

extension View {
    @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
    public func task<V>(geometryID valuePath: KeyPath<GeometryProxy, V>,
                        priority: TaskPriority = .userInitiated,
                        _ action: @escaping (V) async -> Void) -> some View where V : Equatable {
        self.background(
            GeometryReader { geometry in
                let geometryValue = geometry[keyPath: valuePath]
                
                Color.clear
                    .task(id: geometryValue, priority: priority, { await action(geometryValue) })
                
            }
        )
    }
    
}


// MARK: - Type Erasure

extension View {
    public func eraseToAnyView() -> AnyView {
        .init(self)
    }
    
}
