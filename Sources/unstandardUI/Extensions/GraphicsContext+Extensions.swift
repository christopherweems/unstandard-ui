//
// GraphicsContext+Extensions.swift
//  
//
//  Created by Christopher Weems on 10/21/21.
//

import SwiftUI

@available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
extension GraphicsContext {
    public func lineHeight(font: Font?) -> CGFloat {
        self.resolve(Text("X").font(font)).size.height
    }
    
}

@available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
extension GraphicsContext {
    // needs more testing & non-resolved image variations before being complete
    public func draw(_image image: GraphicsContext.ResolvedImage, within frame: CGRect) {
        let imageAspectRatio = image.size.aspectRatio
        let frameAspectRatio = frame.size.aspectRatio
        
        let drawingFrame: CGRect
        
        if imageAspectRatio < frameAspectRatio {
            // image taller than frame, drawing frame should narrow
            drawingFrame = frame.insetBy(dx: frame.height * (frameAspectRatio - imageAspectRatio) / 2, dy: 0)
            
        } else {
            // image wider than frame, drawing frame should shorten
            drawingFrame = frame.insetBy(dx: 0, dy: frame.height * (imageAspectRatio - frameAspectRatio) / 4)
            
        }
        
        self.draw(image, in: drawingFrame, style: .init(antialiased: true))
    }
    
}
