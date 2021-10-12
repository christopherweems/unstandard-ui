//
//  FontReader.swift
//
//
//  Created by Christopher Weems on 10/12/21.
//

import SwiftUI

public struct FontReader<Content>: View where Content : View {
    @Environment(\.font) internal var font
    private var content: (FontProxy) -> Content
    
    public var body: some View {
        let proxy = FontProxy(font: font)
        return content(proxy)
    }
    
    public init(_ content: @escaping (FontProxy) -> Content) {
        self.content = content
        
    }
    
}
