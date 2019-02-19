import XCTest
@testable import Breaker

class TestGraph: XCTestCase {
    func test1Node() {
        let graph = Graph("a")
        XCTAssertEqual("a", graph.node.value)
        XCTAssertTrue(graph.node.vertex.isEmpty)
    }
    
    func test2Nodes() {
        let graph = Graph("ab")
        XCTAssertEqual("a", graph.node.value)
        XCTAssertEqual(1, graph.node.vertex.count)
        XCTAssertEqual("b", graph.node.vertex.first!.node.value)
        XCTAssertTrue(graph.node.vertex.first!.node.vertex.isEmpty)
        XCTAssertTrue(graph.node.vertex.first!.input == 0 || graph.node.vertex.first!.input == 1)
    }
    
    func test3Nodes() {
        let graph = Graph("abc")
        XCTAssertEqual("a", graph.node.value)
        XCTAssertEqual(2, graph.node.vertex.count)
        XCTAssertEqual("b", graph.node.vertex.first!.node.value)
        XCTAssertTrue(graph.node.vertex.first!.node.vertex.isEmpty)
        XCTAssertEqual("c", graph.node.vertex.last!.node.value)
        XCTAssertTrue(graph.node.vertex.first!.node.vertex.isEmpty)
        XCTAssertNotEqual(graph.node.vertex.first!.input, graph.node.vertex.last!.input)
    }
    
    func test4Nodes() {
        let graph = Graph("abcd")
        XCTAssertEqual("a", graph.node.value)
        XCTAssertEqual(2, graph.node.vertex.count)
        XCTAssertEqual("b", graph.node.vertex.first!.node.value)
        XCTAssertEqual("c", graph.node.vertex.last!.node.value)
        XCTAssertFalse(graph.node.vertex.first!.node.vertex.isEmpty)
        XCTAssertTrue(graph.node.vertex.last!.node.vertex.isEmpty)
        XCTAssertEqual("d", graph.node.vertex.first!.node.vertex.first!.node.value)
        XCTAssertNotEqual(graph.node.vertex.first!.input, graph.node.vertex.last!.input)
    }
    
    func test5Nodes() {
        let graph = Graph("abcde")
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
    
    func test6Nodes() {
        let graph = Graph("abcdef")
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
    
    func test7Nodes() {
        let graph = Graph("abcdefg")
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
    
    func test8Nodes() {
        let graph = Graph("abcdefgh")
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
