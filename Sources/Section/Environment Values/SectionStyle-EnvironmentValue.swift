//
//  SectionStyle-EnvironmentValue.swift
//  
//
//  Created by Christopher Weems on 10/1/20.
//

import SwiftUI

fileprivate struct _SectionStyle: EnvironmentKey {
    static var defaultValue = AnySectionStyle(PlainSectionStyle())
}

extension EnvironmentValues {
    var sectionStyle: AnySectionStyle {
        get { self[_SectionStyle.self] }
        set { self[_SectionStyle.self] = newValue }
    }
    
}
