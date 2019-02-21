import XCTest
@testable import Breaker

class TestFactory: XCTestCase {
    func testIncresesCode() {
        XCTAssertEqual(Codes.list[0], Factory.mission(Player()).text)
    }
    
    func testText() {
        let player = Player()
        player.code = 0
        XCTAssertEqual("hello world", Factory.mission(player).text)
    }
    
    func testCypher() {
        XCTAssertEqual(Alphabet.map["h"]! + Alphabet.map["i"]!, Factory.mission(Player()).cypher)
    }
    
    func testAlphabet() {
        XCTAssertEqual(Alphabet.map["h"], Factory.mission(Player()).alphabet[0])
        XCTAssertEqual(Alphabet.map["i"], Factory.mission(Player()).alphabet[1])
    }
    
    func testAlphabetNotRepeating() {
        let player = Player()
        player.code = 0
        let alphabet = Factory.mission(player).alphabet
        XCTAssertEqual(8, alphabet.count)
        XCTAssertEqual(1, alphabet.filter({ $0 == Alphabet.map["l"] }).count)
        XCTAssertEqual(1, alphabet.filter({ $0 == Alphabet.map["o"] }).count)
    }
    
    func testCode2States() {
        XCTAssertEqual(1, Factory.mission(Player()).code.count)
    }
    
    func testCode11States() {
        let player = Player()
        player.code = 0
        XCTAssertEqual(10, Factory.mission(player).code.count)
    }
    
    func testHorizontalRookie() {
        let player = Player()
        player.code = 0
        {
            XCTAssertEqual($0.text.count, $0.horizontal)
        } (Factory.mission(player))
    }
    
    func testHorizontalAdvanced() {
        let player = Player()
        player.level = Advanced()
        player.code = 0
        {
            XCTAssertEqual(Int(ceil(Float($0.text.count) / 2) + 1.0), $0.horizontal)
        } (Factory.mission(player))
    }
    
    func testHorizontalExpert() {
        let player = Player()
        player.level = Expert()
        player.code = 0
        {
            XCTAssertEqual(Int(ceil(Float($0.text.count) / 3) + 2.0), $0.horizontal)
        } (Factory.mission(player))
    }
    
    func testVertical() {
        let player = Player()
        XCTAssertEqual(1, Factory.mission(player).vertical)
        player.level = Advanced()
        XCTAssertEqual(2, Factory.mission(player).vertical)
        player.level = Expert()
        XCTAssertEqual(3, Factory.mission(player).vertical)
    }
}
