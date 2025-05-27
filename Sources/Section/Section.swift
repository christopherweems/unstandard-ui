//
//  Section.swift
//
//
//  Created by Christopher Weems on 10/1/20.
//

import SwiftUI

public struct Section<Style, Header, Content, Footer>: View where Style : SectionStyle, Header: View, Content: View, Footer: View {
    public typealias Configuration = SectionConfiguration
    
    @Environment(\.sectionStyle) private var sectionStyle
    
    fileprivate var style: Style?
    
    public let header: Header
    public let footer: Footer
    
    public let content: () -> Content
    
    @ViewBuilder public var body: some View {
        let configuration = Configuration(header: header, footer: footer)
        let style = self.style?.eraseToAny() ?? sectionStyle
        
        SwiftUI.Section(header: style.header(for: configuration),
                        footer: style.footer(for: configuration),
                        content: content)
        
    }
    
}


// MARK: -

public extension View {
    func sectionStyle<Style: SectionStyle>(_ style: Style) -> some View {
        self.environment(\.sectionStyle, AnySectionStyle(style))
    }
    
}


// MARK: - Convenience Initializers

public extension Section where Style == PlainSectionStyle, Footer == EmptyView {
    init(header: Header, content: @escaping () -> Content) {
        self = .init(style: nil, header: header, footer: .init(), content: content)
    }
    
}

public extension Section where Style == PlainSectionStyle, Header == Text, Footer == EmptyView {
    init(header: String, content: @escaping () -> Content) {
        self = .init(style: nil, header: Text(header), footer: .init(), content: content)
    }
    
}

extension Section {
    public func style<_Style: SectionStyle>(
        _ style: _Style,
    ) -> Section<_Style, Header, Content, Footer> {
        .init(style: style, header: self.header, footer: self.footer, content: self.content)
    }
    
}


// MARK: - Configuration

public struct SectionConfiguration {
    public typealias Header = HeaderFooterView
    public typealias Footer = HeaderFooterView
    
    public struct HeaderFooterView: View {
        private let _view: () -> AnyView
        
        public var body: some View {
            _view()
        }
        
        public init<V: View>(_ header: V) {
            self._view = { AnyView(header) }
            
        }
        
    }
    
    public let header: Header
    public let footer: Footer
    
}

extension SectionConfiguration {
    @MainActor
    public init<Header: View, Footer: View>(header: Header, footer: Footer) {
        self = .init(header: Self.Header(header), footer: Self.Footer(footer))
        
    }
    
}
