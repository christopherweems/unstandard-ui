//
//  HapticFeedbackGeneratorEnvironmentKey.swift
//
//
//  Created by Christopher Weems on 10/18/21.
//

import SwiftUI

internal struct HapticFeedbackGeneratorEnvironmentKey: EnvironmentKey {
    static var defaultValue = HapticFeedbackGenerator()
    
}

extension EnvironmentValues {
    public var hapticFeedbackGenerator: HapticFeedbackGenerator {
        self[HapticFeedbackGeneratorEnvironmentKey.self]
    }
    
}
