//
//  AnySectionStyle.swift
//  
//
//  Created by Christopher Weems on 10/1/20.
//

import SwiftUI

struct AnySectionStyle: SectionStyle {
    var _header: (SectionConfiguration) -> AnyView
    var _footer: (SectionConfiguration) -> AnyView
    
    func header(for configuration: SectionConfiguration) -> AnyView {
        _header(configuration)
    }
    
    func footer(for configuration: SectionConfiguration) -> AnyView {
        _footer(configuration)
    }
    
    init<Style>(_ style: Style) where Style: SectionStyle {
        _header = { AnyView(style.header(for: $0)) }
        _footer = { AnyView(style.footer(for: $0)) }
        
    }
    
}

extension SectionStyle {
    func eraseToAny() -> AnySectionStyle {
        (self as? AnySectionStyle) ?? AnySectionStyle(self)
    }
    
}
