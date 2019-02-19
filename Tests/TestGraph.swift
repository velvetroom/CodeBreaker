import XCTest
@testable import Breaker

class TestGraph: XCTestCase {
    func testSizeRookie() {
        XCTAssertEqual(1, Graph("a", level: Rookie()).route.first?.node?.vertex.count)
    }
    
    func testSizeAdvanced() {
        XCTAssertEqual(2, Graph("a", level: Advanced()).route.first?.node?.vertex.count)
    }
    
    func testSizeExpert() {
        XCTAssertEqual(2, Graph("a", level: Expert()).route.first?.node?.vertex.count)
    }
    
    func test1Node() {
        XCTAssertEqual("a", Graph("a", level: Rookie()).route.first?.node?.value)
    }
    
    func test2Nodes() {
        let graph = Graph("ab", level: Rookie())
        XCTAssertEqual("a", graph.route.first?.node?.value)
        XCTAssertEqual("b", graph.route.first?.node?.vertex.first?.node?.value)
        XCTAssertTrue(graph.route.first?.input == 0 || graph.route.first?.input == 1)
    }
    
    func test3NodesRookie() {
        let graph = Graph("abc", level: Rookie())
        XCTAssertEqual("a", graph.route.first?.node?.value)
        XCTAssertEqual("b", graph.route.first?.node?.vertex.first?.node?.value)
        XCTAssertEqual("c", graph.route.first?.node?.vertex.first?.node?.vertex.first?.node?.value)
        XCTAssertTrue(graph.route.first?.input == 0 || graph.route.first?.input == 1)
        XCTAssertTrue(graph.route.first?.node?.vertex.first?.input == 0 || graph.route.first?.node?.vertex.first?.input == 1)
    }
    
    func test3NodesAdvanced() {
        let graph = Graph("abc", level: Advanced())
        XCTAssertEqual("a", graph.route.first?.node?.value)
        XCTAssertEqual("b", graph.route.first?.node?.vertex.first?.node?.value)
        XCTAssertEqual("c", graph.route.first?.node?.vertex.first?.node?.vertex.first?.node?.value)
    }
    
    func test8NodesRoute() {
        let message = "abcdefgh"
        let graph = Graph(message, level: Advanced())
        XCTAssertEqual(8, graph.route.count)
//        message.map { String($0) }.enumerated().forEach {
//            XCTAssertEqual($0.1, graph.route[$0.0].node!.value)
//        }
    }
}
