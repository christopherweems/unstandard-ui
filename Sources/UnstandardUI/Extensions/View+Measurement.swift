//
//  View+Measurement.swift
//
//
//  Created by Christopher Weems on 10/18/21.
//

import SwiftUI

extension View {
    public func measuring(size: Binding<CGSize>) -> some View {
        self.modifier(SizeModifier(measuredSize: size))
    }
    
}

fileprivate struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
    
}

fileprivate struct SizeModifier: ViewModifier {
    @Binding var measuredSize: CGSize
    
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: SizePreferenceKey.self, value: geometry.size)
            
        }
    }

    func body(content: Content) -> some View {
        content
            .overlay(sizeView)
            .onPreferenceChange(SizePreferenceKey.self) {
                measuredSize = $0
            }
    }
    
}
