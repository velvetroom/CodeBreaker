import XCTest
@testable import Breaker

class TestCodes: XCTestCase {
    func testLength() {
        Codes.list.enumerated().forEach {
            if $0.offset > 0 {
                XCTAssertLessThanOrEqual(Codes.list[$0.offset - 1].count, $0.element.count)
            }
        }
    }
    
    func testNotStartingSpace() {
        Codes.list.forEach { XCTAssertNotEqual(" ", $0.first) }
    }
    
    func testNotEndingSpace() {
        Codes.list.forEach { XCTAssertNotEqual(" ", $0.last) }
    }
}
