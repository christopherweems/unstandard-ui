//
//  SectionStyle.swift
//  
//
//  Created by Christopher Weems on 10/1/20.
//

import protocol SwiftUI.View

public protocol SectionStyle {
    associatedtype Header: View
    associatedtype Footer: View
    
    func header(for configuration: SectionConfiguration) -> Header
    func footer(for configuration: SectionConfiguration) -> Footer
    
}

public extension SectionStyle {
    func header(for configuration: SectionConfiguration) -> some View {
        configuration.header
    }
    
    func footer(for configuration: SectionConfiguration) -> some View {
        configuration.footer
    }
}
