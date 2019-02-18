import XCTest
@testable import Breaker

class TestNode: XCTestCase {
    func testVertexCount() {
        XCTAssertEqual(2, Node().vertex.count)
    }
    
    func testVertexInput() {
        var expected = [0, 1]
        Node().vertex.forEach { vertex in
            expected.removeAll { $0 == vertex.input }
        }
        XCTAssertTrue(expected.isEmpty)
    }
}
