//
//  View+ScrollToTop.swift
//  
//
//  Created by Christopher Weems on 8/4/22.
//

import SwiftUI

#if canImport(UIKit)
import UIKit

#endif

extension View {
    @available(iOS 13, *)
    @available(macOS, unavailable)
    public func onScrollToTop(_ action: @escaping () -> Void) -> some View {
        ModifiedContent(
            content: self,
            modifier: ScrollToTopRecognitionView(action: action))
    }
    
    @available(iOS 13, *)
    @available(macOS, unavailable)
    @_disfavoredOverload
    public func onScrollToTop(_ action: @escaping () async -> Void) -> some View {
        let modifier = ScrollToTopRecognitionView(action: {
            Task { await action() }
            
        })
        
        return ModifiedContent(
            content: self,
            modifier: modifier)
    }
    
}

// MARK: - `ScrollToTopRecognitionView`

fileprivate struct ScrollToTopRecognitionView: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        #if os(iOS)
        content
            .background(_ScrollToTopView(action: action).disabled(true))
        
        #else
        content
        
        #endif
    }
    
}

#if canImport(UIKit)

// MARK: - `_ScrollToTopView`

@available(iOS 13, *)
@available(macOS, unavailable)
fileprivate struct _ScrollToTopView: View {
    internal var action: () -> Void
    
    public var body: some View {
        _View(scrollToTopAction: action)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
}

@available(iOS 13, *)
@available(macOS, unavailable)
extension _ScrollToTopView {
    fileprivate struct _View: UIViewRepresentable {
        let scrollToTopAction: () -> Void
        
        func makeCoordinator() -> Coordinator {
            let c = Coordinator()
            c.scrollToTopAction = scrollToTopAction
            return c
        }
        
        func makeUIView(context: Context) -> UIScrollView {
            let scrollView = ScrollToTopScrollView()
            scrollView.delegate = context.coordinator
            return scrollView
        }
        
        func updateUIView(_ scrollView: UIScrollView, context: Context) {
            context.coordinator.scrollToTopAction = scrollToTopAction
        }
        
    }
    
}

extension _ScrollToTopView._View {
    final class Coordinator: NSObject, UIScrollViewDelegate {
        fileprivate var scrollToTopAction: () -> Void = { }
        
        func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
            scrollToTopAction()
            return false
        }
        
    }
    
}



// MARK: - `ScrollToTopScrollView`

fileprivate final class ScrollToTopScrollView: UIScrollView {
    override func layoutSubviews() {
        super.layoutSubviews()
        contentSize =  CGSize(width: bounds.size.width, height: bounds.size.height + 1)
        contentOffset.y = 1
    }
    
}

#endif
