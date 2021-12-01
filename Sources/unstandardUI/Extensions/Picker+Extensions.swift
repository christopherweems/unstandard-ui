//
//  Picker+Extensions.swift
//  
//
//  Created by Christopher Weems on 12/1/21.
//

import SwiftUI

extension Picker {
    public init<S, ItemContent>(_ title: S, selection: Binding<SelectionValue>, reversed: Bool = false,
                                @ViewBuilder itemContent: @escaping (SelectionValue) -> ItemContent)
    where S : StringProtocol, SelectionValue : CaseIterable, SelectionValue.AllCases : RandomAccessCollection,
    ItemContent : View, Label == Text, Content == AnyView {
        @ViewBuilder
        var content: some View {
            ForEach(SelectionValue.allCases, id: \.self) { value in
                itemContent(value)
                    .id(value)
            }
            .reversed(reversed, id: \.self)
        }
        
        self.init(title, selection: selection, content: {
            AnyView(content)
        })
    }
    
}
