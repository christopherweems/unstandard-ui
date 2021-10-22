//
//  OpenURLAction+Extensions.swift
//
//
//  Created by Christopher Weems on 11/4/20.
//

#if canImport(UIKit)
import SwiftUI

@available(iOS 14, tvOS 14, *)
extension OpenURLAction {
    public enum Destination {
        case applicationSettings
        
    }
    
    public func callAsFunction(_ destination: Destination) {
        let destinationURL: URL
        
        switch destination {
        case .applicationSettings:
            destinationURL = URL(string: UIApplication.openSettingsURLString)!
            
        }
        
        self.callAsFunction(destinationURL)
    }
    
}

#endif
