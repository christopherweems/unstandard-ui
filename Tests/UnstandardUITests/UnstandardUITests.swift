import XCTest
import SwiftUI
@testable import UnstandardUI

final class UnstandardUITests: XCTestCase {
    func testBindingNilCoalescingOperator() throws {
        let binding = Binding<Bool?>.constant(nil)
        let coalescedBinding = binding ?? true
        XCTAssertTrue(coalescedBinding.wrappedValue)
    }
    
}
