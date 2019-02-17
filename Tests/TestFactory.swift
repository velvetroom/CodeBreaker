import XCTest
@testable import Breaker

class TestFactory: XCTestCase {
    func testAssignText() {
        XCTAssertEqual("hello world", Factory.mission("hello world").text)
    }
    
    func testAssignCypher() {
        XCTAssertEqual(Alphabet.map["h"]! + Alphabet.map["i"]!, Factory.mission("hi").cypher)
    }
    
    func testCode2States() {
        XCTAssertEqual(1, Factory.mission("hi").code.count)
    }
}
