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

// MARK: - Setting Font Weight

extension View where Body == Text {
    public func fontWeight(_ weight: Font.Weight) -> Text {
        body.fontWeight(weight)
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


// MARK: - `View.onRecalculate { .. }`

@available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
extension View {
    public func onRecalculate(_ update: @escaping () -> Void) -> some View {
        DispatchQueue.main.async(execute: update)
        return self
    }
    
}


// MARK: -

extension View {
    // TODO: Test method & rename
    public func frame(_frame frame: CGRect, alignment: Alignment = .center) -> some View {
        self.frame(width: frame.width, height: frame.height, alignment: alignment)
            .offset(x: frame.origin.x, y: frame.origin.y)
    }
    
}


// MARK: -

@available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
extension View {
    public func safeAreaInset(top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) -> some View {
        let insets = EdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
        return self.safeAreaInset(insets)
    }
    
    @ViewBuilder public func safeAreaInset(_ insets: EdgeInsets) -> some View {
        self
            .safeAreaInset(edge: .top) {
                Spacer().frame(height: insets.top)
            }
            .safeAreaInset(edge: .leading) {
                Spacer().frame(width: insets.leading)
            }
            .safeAreaInset(edge: .trailing) {
                Spacer().frame(width: insets.trailing)
            }
            .safeAreaInset(edge: .bottom) {
                Spacer().frame(height: insets.bottom)
            }
    }
    
}



// MARK: - Type Erasure

extension View {
    public func eraseToAnyView() -> AnyView {
        .init(self)
    }
    
}
