import XCTest
@testable import Breaker

class TestAlphabet: XCTestCase {
    func testCompleteness() {
        XCTAssertNotNil(Alphabet.map[" "])
        XCTAssertFalse(Alphabet.map[" "]!.isEmpty)
        ("a".unicodeScalars.first!.value ... "z".unicodeScalars.first!.value).forEach {
            XCTAssertNotNil(Alphabet.map[String(UnicodeScalar($0)!)])
            XCTAssertFalse((Alphabet.map[String(UnicodeScalar($0)!)])!.isEmpty)
        }
    }
    
    func testNoRepeat() {
        Alphabet.map.values.enumerated().forEach { i in
            XCTAssertNil(Alphabet.map.values.enumerated().first { $0.element == i.element && $0.offset != i.offset })
        }
    }
    
    func testSize() {
        XCTAssertEqual(("a".unicodeScalars.first!.value ... "z".unicodeScalars.first!.value).count + 1, Alphabet.map.count)
    }
}
