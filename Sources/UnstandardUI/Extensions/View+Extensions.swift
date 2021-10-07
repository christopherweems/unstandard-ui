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


// MARK: Creating a Stack from a group

extension View {
    /// Usage: Group { .. } .stack(.vertical)
    @ViewBuilder public func stack(_ axis: Axis) -> some View {
        switch axis {
        case .horizontal:
            HStack(content: { self })
            
        case .vertical:
            VStack(content: { self })
            
        }
    }
    
}


// MARK: - Attaching a long press gesture with a configuration

@available(tvOS 14, *)
@available(tvOS, unavailable)
extension View {
    public func onLongPressGesture(performConfiguration configuration: LongPressGestureConfiguration) -> some View {
        self.onLongPressGesture(minimumDuration: configuration.minimumDuration,
                                maximumDistance: configuration.maximumDistance,
                                perform: configuration.action,
                                onPressingChanged: configuration.onPressingChanged)
    }
    
}


// MARK: - Type Erasure

extension View {
    public func eraseToAnyView() -> AnyView {
        .init(self)
    }
    
}
