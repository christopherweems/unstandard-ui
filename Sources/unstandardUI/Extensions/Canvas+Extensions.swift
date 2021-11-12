//
//  Canvas+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/12/21.
//

import SwiftUI

@available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
extension Canvas {
    public init(opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear,
                transform: @escaping (CanvasProxy) -> CGAffineTransform,
                rendersAsynchronously: Bool = false,
                renderer: @escaping (inout GraphicsContext, CGSize) -> Void) where Symbols == EmptyView {
        self.init(opaque: opaque, colorMode: colorMode,
                  rendersAsynchronously: rendersAsynchronously) { context, size in
            let canvasProxy = CanvasProxy(size: size)
            let transform = transform(canvasProxy)
            let transformedSize = CGRect(origin: .zero, size: size)
                .applying(transform)
                .size
            
            context.transform = transform
            
            renderer(&context, transformedSize)
        }
        
    }
    
}
