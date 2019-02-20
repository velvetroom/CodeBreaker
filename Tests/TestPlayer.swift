import XCTest
@testable import Breaker

class TestPlayer: XCTestCase {
    func testEncoding() {
        let player = Player()
        player.level = Expert()
        player.code = 100
        XCTAssertEqual("""
{"level":"Breaker.Expert","code":100}
""", String(decoding: try! JSONEncoder().encode(player), as: UTF8.self))
    }
    
    func testDecoding() {
        {
            XCTAssertTrue($0.level is Expert)
            XCTAssertEqual(100, $0.code)
        } (try! JSONDecoder().decode(Player.self, from: Data("""
{"level":"Breaker.Expert","code":100}
""".utf8)))
    }
}
