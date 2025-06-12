//
//  HapticFeedbackGeneratorEnvironmentKey.swift
//
//
//  Created by Christopher Weems on 10/18/21.
//

#if canImport(UIKit)
import SwiftUI

internal struct HapticFeedbackGeneratorEnvironmentKey: EnvironmentKey {
    static let defaultValue = HapticFeedbackGenerator()
    
}

extension EnvironmentValues {
    public var hapticFeedbackGenerator: HapticFeedbackGenerator {
        self[HapticFeedbackGeneratorEnvironmentKey.self]
    }
    
}

#endif
