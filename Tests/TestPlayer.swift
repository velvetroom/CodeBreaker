import XCTest
@testable import Breaker

class TestPlayer: XCTestCase {
    func testEncoding() {
        let player = Player()
        player.level = Expert()
        XCTAssertEqual("""
{"level":"Breaker.Expert"}
""", String(decoding: try! JSONEncoder().encode(player), as: UTF8.self))
    }
    
    func testDecoding() {
        XCTAssertTrue(try! JSONDecoder().decode(Player.self, from: Data("""
{"level":"Breaker.Expert"}
""".utf8)).level is Expert)
    }
}
