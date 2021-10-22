//
//  HapticView.swift
//
//
//  Created by Christopher Weems on 10/18/21.
//

#if canImport(UIKit)
import SwiftUI

public protocol HapticView: View {
    associatedtype FeedbackEvent : HapticFeedbackEvent
    var feedbackGenerator: HapticFeedbackGenerator { get }
    
}

extension HapticView {
    public func provideFeedback(for feedbackEvent: FeedbackEvent) {
        feedbackGenerator.provideFeedback(for: feedbackEvent)
    }
    
}

#endif
