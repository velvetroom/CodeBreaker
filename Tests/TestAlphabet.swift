import XCTest
@testable import Breaker

class TestAlphabet: XCTestCase {
    func testCompleteness() {
        XCTAssertNotNil(Alphabet().list[" "])
        XCTAssertFalse(Alphabet().list[" "]!.isEmpty)
        ("a".unicodeScalars.first!.value ... "z".unicodeScalars.first!.value).forEach {
            XCTAssertNotNil(Alphabet().list[String(UnicodeScalar($0)!)])
            XCTAssertFalse((Alphabet().list[String(UnicodeScalar($0)!)])!.isEmpty)
        }
    }
    
    func testNoRepeat() {
        Alphabet().list.values.enumerated().forEach { i in
            XCTAssertNil(Alphabet().list.values.enumerated().first { $0.element == i.element && $0.offset != i.offset })
        }
    }
    
    func testSize() {
        XCTAssertEqual(("a".unicodeScalars.first!.value ... "z".unicodeScalars.first!.value).count + 1, Alphabet().list.count)
    }
}
