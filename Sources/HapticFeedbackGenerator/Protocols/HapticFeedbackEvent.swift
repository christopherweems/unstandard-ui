//
//  HapticFeedbackGenerator.swift
//
//
//  Created by Christopher Weems on 10/18/21.
//

import typealias Foundation.TimeInterval

public protocol HapticFeedbackEvent {
    var feedbackDescription: HapticFeedbackGenerator.FeedbackDescription { get }
    var schedulingTolerance: TimeInterval { get }
    
}

extension HapticFeedbackEvent {
    public var schedulingTolerance: TimeInterval {
        switch self.feedbackDescription {
        case .impact:
            return 0
            
        case .notification:
            return 0.25
            
        case .selectionChange:
            return 0
            
        }
    }
    
}
