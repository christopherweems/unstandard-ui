//
//  TupleViewBuilder.swift
//  
//
//  Created by Christopher Weems on 9/15/20.
//

import SwiftUI

@resultBuilder
public struct TupleViewBuilder {
    public static func buildBlock<A, B>(_ first: A, _ second: B) -> TupleView<(A, B)> where A : View, B : View {
        TupleView((first, second))
    }
    
}
