import XCTest
@testable import Breaker

class TestGraph: XCTestCase {
    func test1Node() {
        let graph = Graph("a", level:Rookie())
        XCTAssertEqual("a", graph.node.value)
        XCTAssertTrue(graph.node.vertex.isEmpty)
    }
    
    func test2Nodes() {
        let graph = Graph("ab", level:Rookie())
        XCTAssertEqual("a", graph.node.value)
        XCTAssertEqual(1, graph.node.vertex.count)
        XCTAssertEqual("b", graph.node.vertex.first!.node.value)
        XCTAssertTrue(graph.node.vertex.first!.node.vertex.isEmpty)
        XCTAssertTrue(graph.node.vertex.first!.input == 0 || graph.node.vertex.first!.input == 1)
    }
    
    func test3NodesRookie() {
        let graph = Graph("abc", level:Rookie())
        XCTAssertEqual("a", graph.node.value)
//        XCTAssertEqual(1, graph.node.vertex.count)
//        XCTAssertEqual("b", graph.node.vertex.first!.node.value)
//        XCTAssertEqual(1, graph.node.vertex.first!.node.vertex.count)
//        XCTAssertEqual("c", graph.node.vertex.first!.node.vertex.first!.node.value)
//        XCTAssertTrue(graph.node.vertex.first!.node.vertex.first!.node.vertex.isEmpty)
    }
    
    func test3NodesAdvanced() {
        let graph = Graph("abc", level:Advanced())
        XCTAssertEqual("a", graph.node.value)
        XCTAssertEqual(2, graph.node.vertex.count)
        XCTAssertEqual("b", graph.node.vertex.first!.node.value)
        XCTAssertTrue(graph.node.vertex.first!.node.vertex.isEmpty)
        XCTAssertEqual("c", graph.node.vertex.last!.node.value)
        XCTAssertTrue(graph.node.vertex.first!.node.vertex.isEmpty)
        XCTAssertNotEqual(graph.node.vertex.first!.input, graph.node.vertex.last!.input)
    }
    
    func test4NodesAdvanced() {
        let graph = Graph("abcd", level:Advanced())
        XCTAssertEqual("a", graph.node.value)
        XCTAssertEqual(2, graph.node.vertex.count)
        XCTAssertEqual("b", graph.node.vertex.first!.node.value)
        XCTAssertEqual("c", graph.node.vertex.last!.node.value)
        XCTAssertFalse(graph.node.vertex.first!.node.vertex.isEmpty)
        XCTAssertTrue(graph.node.vertex.last!.node.vertex.isEmpty)
        XCTAssertEqual("d", graph.node.vertex.first!.node.vertex.first!.node.value)
        XCTAssertNotEqual(graph.node.vertex.first!.input, graph.node.vertex.last!.input)
    }
    
    func test5NodesAdvanced() {
        let graph = Graph("abcde", level:Advanced())
        XCTAssertEqual("a", graph.node.value)
        XCTAssertEqual(2, graph.node.vertex.count)
        XCTAssertEqual("b", graph.node.vertex.first!.node.value)
        XCTAssertEqual("c", graph.node.vertex.last!.node.value)
        XCTAssertEqual(2, graph.node.vertex.first!.node.vertex.count)
        XCTAssertTrue(graph.node.vertex.last!.node.vertex.isEmpty)
        XCTAssertEqual("d", graph.node.vertex.first!.node.vertex.first!.node.value)
        XCTAssertEqual("e", graph.node.vertex.first!.node.vertex.last!.node.value)
        XCTAssertNotEqual(graph.node.vertex.first!.input, graph.node.vertex.last!.input)
        XCTAssertNotEqual(graph.node.vertex.first!.node.vertex.first!.input, graph.node.vertex.first!.node.vertex.last!.input)
    }
    
    func test6NodesAdvanced() {
        let graph = Graph("abcdef", level:Advanced())
        XCTAssertEqual("a", graph.node.value)
        XCTAssertEqual(2, graph.node.vertex.count)
        XCTAssertEqual("b", graph.node.vertex.first!.node.value)
        XCTAssertEqual("c", graph.node.vertex.last!.node.value)
        XCTAssertEqual(2, graph.node.vertex.first!.node.vertex.count)
        XCTAssertFalse(graph.node.vertex.last!.node.vertex.isEmpty)
        XCTAssertEqual("d", graph.node.vertex.first!.node.vertex.first!.node.value)
        XCTAssertEqual("e", graph.node.vertex.first!.node.vertex.last!.node.value)
        XCTAssertEqual("f", graph.node.vertex.last!.node.vertex.first!.node.value)
        XCTAssertNotEqual(graph.node.vertex.first!.node.vertex.first!.input, graph.node.vertex.first!.node.vertex.last!.input)
    }
    
    func test7NodesAdvanced() {
        let graph = Graph("abcdefg", level:Advanced())
        XCTAssertEqual("a", graph.node.value)
        XCTAssertEqual(2, graph.node.vertex.count)
        XCTAssertEqual("b", graph.node.vertex.first!.node.value)
        XCTAssertEqual("c", graph.node.vertex.last!.node.value)
        XCTAssertEqual(2, graph.node.vertex.first!.node.vertex.count)
        XCTAssertEqual(2, graph.node.vertex.last!.node.vertex.count)
        XCTAssertEqual("d", graph.node.vertex.first!.node.vertex.first!.node.value)
        XCTAssertEqual("e", graph.node.vertex.first!.node.vertex.last!.node.value)
        XCTAssertEqual("f", graph.node.vertex.last!.node.vertex.first!.node.value)
        XCTAssertEqual("g", graph.node.vertex.last!.node.vertex.last!.node.value)
        XCTAssertNotEqual(graph.node.vertex.first!.node.vertex.first!.input, graph.node.vertex.first!.node.vertex.last!.input)
        XCTAssertNotEqual(graph.node.vertex.last!.node.vertex.first!.input, graph.node.vertex.last!.node.vertex.last!.input)
    }
    
    func test8NodesAdvanced() {
        let graph = Graph("abcdefgh", level:Advanced())
        XCTAssertEqual("a", graph.node.value)
        XCTAssertEqual(2, graph.node.vertex.count)
        XCTAssertEqual("b", graph.node.vertex.first!.node.value)
        XCTAssertEqual("c", graph.node.vertex.last!.node.value)
        XCTAssertEqual(2, graph.node.vertex.first!.node.vertex.count)
        XCTAssertEqual(2, graph.node.vertex.last!.node.vertex.count)
        XCTAssertEqual("d", graph.node.vertex.first!.node.vertex.first!.node.value)
        XCTAssertEqual("e", graph.node.vertex.first!.node.vertex.last!.node.value)
        XCTAssertEqual("f", graph.node.vertex.last!.node.vertex.first!.node.value)
        XCTAssertEqual("g", graph.node.vertex.last!.node.vertex.last!.node.value)
        XCTAssertEqual("h", graph.node.vertex.first!.node.vertex.first!.node.vertex.first!.node.value)
        XCTAssertNotEqual(graph.node.vertex.first!.node.vertex.first!.input, graph.node.vertex.first!.node.vertex.last!.input)
        XCTAssertNotEqual(graph.node.vertex.last!.node.vertex.first!.input, graph.node.vertex.last!.node.vertex.last!.input)
    }
}
