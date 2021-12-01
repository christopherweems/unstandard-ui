//
//  ForEach+Extensions.swift
//  
//
//  Created by Christopher Weems on 12/1/21.
//

import SwiftUI

extension ForEach
where Data : RandomAccessCollection, Data.Element : Identifiable, Data.Element.ID == ID, Content : View {
    @ViewBuilder
    public func reversed(_ reverseOrder: Bool = true) -> some View {
        if reverseOrder {
            ForEach<ReversedCollection<Data>, ID, Content>(self.data.reversed(), content: self.content)
            
        } else {
            self
            
        }
    }
    
}

extension ForEach
where Data : RandomAccessCollection, Content : View {
    // id argument is required because `ForEach` does not expose the id KeyPath
    @ViewBuilder
    public func reversed(_ reverseOrder: Bool = true, id: KeyPath<Data.Element, ID>) -> some View {
        if reverseOrder {
            ForEach<ReversedCollection<Data>, ID, Content>(self.data.reversed(), id: id, content: content)
            
        } else {
            self
            
        }
    }
    
}
