import XCTest
import SwiftUI
@testable import unstandardUI

final class unstandardUITests: XCTestCase {
    func testBindingNilCoalescingOperator() throws {
        let binding = Binding<Bool?>.constant(nil)
        let coalescedBinding = binding ?? true
        XCTAssertTrue(coalescedBinding.wrappedValue)
    }
    
}
