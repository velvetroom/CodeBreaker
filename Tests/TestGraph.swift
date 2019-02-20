import XCTest
@testable import Breaker

class TestGraph: XCTestCase {
    func testA() {
        XCTAssertEqual("a", Graph("a", level: Rookie()).route.first?.node?.state)
        XCTAssertEqual(1, Graph("a", level: Rookie()).route.count)
    }
    
    func testAB() {
        XCTAssertEqual("a", Graph("ab", level: Rookie()).route.first?.node?.state)
        XCTAssertEqual("b", Graph("ab", level: Rookie()).route.first?.node?.vertex.first?.node?.state)
        XCTAssertEqual(2, Graph("ab", level: Rookie()).route.count)
    }
    
    func testSizeRookie() {
        XCTAssertEqual(1, Graph("a", level: Rookie()).route.first?.node?.vertex.count)
    }
    
    func testSizeAdvanced() {
        XCTAssertEqual(2, Graph("a", level: Advanced()).route.first?.node?.vertex.count)
    }
    
    func testSizeExpert() {
        XCTAssertEqual(2, Graph("a", level: Expert()).route.first?.node?.vertex.count)
    }
    
    func testInput2Nodes() {
        let graph = Graph("ab", level: Rookie())
        XCTAssertTrue(graph.route.first?.input == 0 || graph.route.first?.input == 1)
    }
    
    func testInput3Nodes() {
        let graph = Graph("abc", level: Rookie())
        XCTAssertTrue(graph.route.first?.input == 0 || graph.route.first?.input == 1)
        XCTAssertTrue(graph.route.first?.node?.vertex.first?.input == 0 || graph.route.first?.node?.vertex.first?.input == 1)
    }
    
    func test8NodesRoute() {
        let message = "abcdefgh"
        let graph = Graph(message, level: Advanced())
        XCTAssertEqual(8, graph.route.count)
        message.map { String($0) }.enumerated().forEach {
            XCTAssertEqual($0.1, graph.route[$0.0].node!.state)
        }
    }
    
    func testAA() {
        let graph = Graph("aa", level: Rookie())
        XCTAssertEqual("a", graph.route.first?.node?.state)
        XCTAssertEqual("a", graph.route.last?.node?.state)
        XCTAssertTrue(graph.route.first?.node === graph.route.last?.node)
        XCTAssertEqual(2, graph.route.count)
    }
}
