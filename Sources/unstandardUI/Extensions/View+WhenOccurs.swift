//
//  View+When.swift
//  
//
//  Created by Christopher Weems on 10/29/21.
//

import SwiftUI

@available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
extension View {
    // Like `View.onChange(of:perform:)` but guarenteed to occur only the first time predicate becomes true
    public func when(_ predicate: Bool, perform action: @escaping () -> Void) -> some View {
        self.modifier(WhenViewModifier(predicate: predicate, action: action))
    }
    
}

@available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
internal struct WhenViewModifier: ViewModifier {
    @State var hasOccurred = false
    
    let predicate: Bool
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                guard predicate else { return }
                assert(!hasOccurred)
                action()
                hasOccurred = true
            }
            .onChange(of: predicate == true && !hasOccurred) {
                guard !hasOccurred else { return }
                action()
            }
    }
    
}
