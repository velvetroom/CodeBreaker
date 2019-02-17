import XCTest
@testable import Breaker

class TestCodes: XCTestCase {
    func testLength() {
        Codes().list.enumerated().forEach {
            if $0.offset > 0 {
                XCTAssertGreaterThan(Codes().list[$0.offset - 1], $0.element)
            }
        }
    }
}
