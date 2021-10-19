//
//  HapticFeedbackGenerator.swift
//
//  Created by Christopher Weems on 10/18/21.
//

import UIKit

public struct HapticFeedbackGenerator {
    private static let mediumImpactGenerator = UIImpactFeedbackGenerator(style: .medium)
    private static let lightImpactGenerator = UIImpactFeedbackGenerator(style: .light)
    private static let heavyImpactGenerator = UIImpactFeedbackGenerator(style: .heavy)
    private static let softImpactGenerator = UIImpactFeedbackGenerator(style: .soft)
    private static let rigidImpactGenerator = UIImpactFeedbackGenerator(style: .rigid)
    
    private static let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
    private static let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    
    public enum FeedbackDescription {
        case impact(_ style: ImpactStyle = .medium, intensity: Double = 1)
        case notification(_ type: NotificationType)
        case selectionChange
        
    }
    
    public func provideFeedback(for event: HapticFeedbackEvent) {
        switch event.feedbackDescription {
        case let .impact(style, intensity):
            self.performImpactHaptic(style: style, intensity: intensity)
            
        case let .notification(notificationType):
            self.performNotificationHaptic(type: notificationType)
            
        case .selectionChange:
            Self.selectionFeedbackGenerator.selectionChanged()
            
        }
    }
    
}

extension HapticFeedbackGenerator.FeedbackDescription {
    public enum ImpactStyle {
        case heavy
        case light
        case medium
        
        case rigid
        case soft
        
    }
    
    public enum NotificationType {
        case error
        case success
        case warning
        
    }
    
}

extension HapticFeedbackGenerator {
    private func performImpactHaptic(style: FeedbackDescription.ImpactStyle, intensity: Double) {
        switch style {
        case .medium:
            Self.mediumImpactGenerator.impactOccurred(intensity: intensity)
            
        case .light:
            Self.lightImpactGenerator.impactOccurred(intensity: intensity)
            
        case .heavy:
            Self.heavyImpactGenerator.impactOccurred(intensity: intensity)
            
        case .rigid:
            Self.rigidImpactGenerator.impactOccurred(intensity: intensity)
            
        case .soft:
            Self.softImpactGenerator.impactOccurred(intensity: intensity)
            
        }
        
    }
    
    private func performNotificationHaptic(type: FeedbackDescription.NotificationType) {
        let feedbackType = UINotificationFeedbackGenerator.FeedbackType(type)
        Self.notificationFeedbackGenerator.notificationOccurred(feedbackType)
    }
    
}

extension UINotificationFeedbackGenerator {
    internal func notificationOccurred(_ notificationType: HapticFeedbackGenerator.FeedbackDescription.NotificationType) {
        self.notificationOccurred(.init(notificationType))
    }
    
}

extension UINotificationFeedbackGenerator.FeedbackType {
    internal init(_ notificationType: HapticFeedbackGenerator.FeedbackDescription.NotificationType) {
        switch notificationType {
        case .warning:
            self = .warning
            
        case .error:
            self = .error
            
        case .success:
            self = .success
            
        }
    }
    
}
