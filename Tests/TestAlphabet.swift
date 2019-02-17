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
        XCTAssertEqual(("a".unicodeScalars.first!.value ... "z".unicodeScalars.first!.value).count + 1, Alphabet().list.count)
    }
}
