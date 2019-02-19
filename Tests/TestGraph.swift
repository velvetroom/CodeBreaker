import XCTest
@testable import Breaker

class TestGraph: XCTestCase {
    func testSizeRookie() {
        XCTAssertEqual(1, Graph("a", level: Rookie()).vertex.node!.vertex.count)
    }
    
    func testSizeAdvanced() {
        XCTAssertEqual(2, Graph("a", level: Advanced()).vertex.node!.vertex.count)
    }
    
    func testSizeExpert() {
        XCTAssertEqual(2, Graph("a", level: Expert()).vertex.node!.vertex.count)
    }
    
    func test1Node() {
        let graph = Graph("a", level: Rookie())
        XCTAssertEqual("a", graph.vertex.node!.value)
    }
    
    func test2Nodes() {
        let graph = Graph("ab", level: Rookie())
        XCTAssertEqual("a", graph.vertex.node!.value)
        XCTAssertEqual("b", graph.vertex.node!.vertex.first!.node!.value)
        XCTAssertTrue(graph.vertex.node!.vertex.first!.input == 0 || graph.vertex.node!.vertex.first!.input == 1)
    }
    
    func test3NodesRookie() {
        let graph = Graph("abc", level: Rookie())
        XCTAssertEqual("a", graph.vertex.node!.value)
        XCTAssertEqual("b", graph.vertex.node!.vertex.first!.node!.value)
        XCTAssertEqual("c", graph.vertex.node!.vertex.first!.node!.vertex.first!.node!.value)
        XCTAssertTrue(graph.vertex.node!.vertex.first!.input == 0 || graph.vertex.node!.vertex.first!.input == 1)
        XCTAssertTrue(graph.vertex.node!.vertex.first!.node!.vertex.first!.input == 0 ||
            graph.vertex.node!.vertex.first!.node!.vertex.first!.input == 1)
    }
    
    func test3NodesAdvanced() {
        let graph = Graph("abc", level: Advanced())
        XCTAssertEqual("a", graph.vertex.node!.value)
        XCTAssertEqual("b", graph.vertex.node!.vertex.first!.node!.value)
        XCTAssertEqual("c", graph.vertex.node!.vertex.last!.node!.value)
        XCTAssertNotEqual(graph.vertex.node!.vertex.first!.input, graph.vertex.node!.vertex.last!.input)
    }
    
    func test4NodesRookie() {
        let graph = Graph("abcd", level: Rookie())
        XCTAssertEqual("a", graph.vertex.node!.value)
        XCTAssertEqual("b", graph.vertex.node!.vertex.first!.node!.value)
        XCTAssertEqual("c", graph.vertex.node!.vertex.first!.node!.vertex.first!.node!.value)
        XCTAssertEqual("d", graph.vertex.node!.vertex.first!.node!.vertex.first!.node!.vertex.first!.node!.value)
    }
    
    func test4NodesAdvanced() {
        let graph = Graph("abcd", level: Advanced())
        XCTAssertEqual("a", graph.vertex.node!.value)
        XCTAssertEqual("b", graph.vertex.node!.vertex.first!.node!.value)
        XCTAssertEqual("c", graph.vertex.node!.vertex.last!.node!.value)
        XCTAssertEqual("d", graph.vertex.node!.vertex.first!.node!.vertex.first!.node!.value)
    }
    
    func test5NodesAdvanced() {
        let graph = Graph("abcde", level: Advanced())
        XCTAssertEqual("a", graph.vertex.node!.value)
        XCTAssertEqual("b", graph.vertex.node!.vertex.first!.node!.value)
        XCTAssertEqual("c", graph.vertex.node!.vertex.last!.node!.value)
        XCTAssertEqual("d", graph.vertex.node!.vertex.first!.node!.vertex.first!.node!.value)
        XCTAssertEqual("e", graph.vertex.node!.vertex.first!.node!.vertex.last!.node!.value)
    }
    
    func test6NodesAdvanced() {
        let graph = Graph("abcdef", level: Advanced())
        XCTAssertEqual("a", graph.vertex.node!.value)
        XCTAssertEqual("b", graph.vertex.node!.vertex.first!.node!.value)
        XCTAssertEqual("c", graph.vertex.node!.vertex.last!.node!.value)
        XCTAssertEqual("d", graph.vertex.node!.vertex.first!.node!.vertex.first!.node!.value)
        XCTAssertEqual("e", graph.vertex.node!.vertex.first!.node!.vertex.last!.node!.value)
        XCTAssertEqual("f", graph.vertex.node!.vertex.last!.node!.vertex.first!.node!.value)
    }
    
    func test7NodesAdvanced() {
        let graph = Graph("abcdefg", level: Advanced())
        XCTAssertEqual("a", graph.vertex.node!.value)
        XCTAssertEqual("b", graph.vertex.node!.vertex.first!.node!.value)
        XCTAssertEqual("c", graph.vertex.node!.vertex.last!.node!.value)
        XCTAssertEqual("d", graph.vertex.node!.vertex.first!.node!.vertex.first!.node!.value)
        XCTAssertEqual("e", graph.vertex.node!.vertex.first!.node!.vertex.last!.node!.value)
        XCTAssertEqual("f", graph.vertex.node!.vertex.last!.node!.vertex.first!.node!.value)
        XCTAssertEqual("g", graph.vertex.node!.vertex.last!.node!.vertex.last!.node!.value)
    }
    
    func test8NodesAdvanced() {
        let graph = Graph("abcdefgh", level: Advanced())
        XCTAssertEqual("a", graph.vertex.node!.value)
        XCTAssertEqual("b", graph.vertex.node!.vertex.first!.node!.value)
        XCTAssertEqual("c", graph.vertex.node!.vertex.last!.node!.value)
        XCTAssertEqual("d", graph.vertex.node!.vertex.first!.node!.vertex.first!.node!.value)
        XCTAssertEqual("e", graph.vertex.node!.vertex.first!.node!.vertex.last!.node!.value)
        XCTAssertEqual("f", graph.vertex.node!.vertex.last!.node!.vertex.first!.node!.value)
        XCTAssertEqual("g", graph.vertex.node!.vertex.last!.node!.vertex.last!.node!.value)
        XCTAssertEqual("h", graph.vertex.node!.vertex.first!.node!.vertex.first!.node!.vertex.first!.node!.value)
    }
    
    func test8NodesRoute() {
        let message = "abcdefgh"
        let graph = Graph(message, level: Advanced())
        XCTAssertEqual(8, graph.route.count)
        message.map { String($0) }.enumerated().forEach { XCTAssertEqual($0.1, graph.route[$0.offset].node!.value) }
    }
    
//    func testAA() {
//        let graph = Graph("aa", level:Advanced())
//        XCTAssertTrue(graph.vertex.node === graph.vertex.node?.vertex.first?.node)
//    }
}
