import XCTest
@testable import Breaker

class TestFactory: XCTestCase {
    func testIncresesCode() {
        XCTAssertEqual(Codes.list[0], Factory.mission(Player()).text)
    }
    
    func testAssignText() {
        let player = Player()
        player.code = 0
        XCTAssertEqual("hello world", Factory.mission(player).text)
    }
    
    func testAssignCypher() {
        XCTAssertEqual(Alphabet.map["h"]! + Alphabet.map["i"]!, Factory.mission(Player()).cypher)
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
