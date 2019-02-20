import XCTest
@testable import Breaker

class TestFactory: XCTestCase {
    func testAssignText() {
        XCTAssertEqual("hello world", Factory.mission("hello world", level: Rookie()).text)
    }
    
    func testAssignCypher() {
        XCTAssertEqual(Alphabet.map["h"]! + Alphabet.map["i"]!, Factory.mission("hi", level: Rookie()).cypher)
    }
    
    func testCode2States() {
        XCTAssertEqual(1, Factory.mission("hi", level: Rookie()).code.count)
    }
    
    func testCode11States() {
        XCTAssertEqual(10, Factory.mission("hello world", level: Rookie()).code.count)
    }
}
