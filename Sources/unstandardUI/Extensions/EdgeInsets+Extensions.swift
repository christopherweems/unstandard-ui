//
//  EdgeInsets.swift
//  
//
//  Created by Christopher Weems on 10/21/21.
//

import SwiftUI

extension EdgeInsets {
    public static let zero = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    
}

extension EdgeInsets : Hashable {
    public func hash(into hasher: inout Hasher) {
        trailing.hash(into: &hasher)
        top.hash(into: &hasher)
        leading.hash(into: &hasher)
        bottom.hash(into: &hasher)
        
    }
    
}
