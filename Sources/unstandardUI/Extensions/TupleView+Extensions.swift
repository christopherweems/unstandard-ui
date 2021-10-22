//
//  TupleView+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/15/20.
//

import SwiftUI

extension TupleView {
    public init(@TupleViewBuilder grouping builder: () -> TupleView<T>) {
        self = builder()
        
    }
    
}
