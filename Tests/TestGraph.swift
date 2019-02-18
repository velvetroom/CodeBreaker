import XCTest
@testable import Breaker

class TestGraph: XCTestCase {
    private var graph: Graph!
    
    override func setUp() {
        graph = Graph()
    }
    
    func test1Node() {
        graph.add("a")
        XCTAssertEqual("a", graph.node.value)
        XCTAssertTrue(graph.node.vertex.isEmpty)
    }
    
    func test2Nodes() {
        graph.add("a")
        graph.add("b")
        XCTAssertEqual("a", graph.node.value)
        XCTAssertEqual(1, graph.node.vertex.count)
        XCTAssertEqual("b", graph.node.vertex.first!.node.value)
        XCTAssertTrue(graph.node.vertex.first!.node.vertex.isEmpty)
        XCTAssertTrue(graph.node.vertex.first!.input == 0 || graph.node.vertex.first!.input == 1)
    }
    
    func test3Nodes() {
        graph.add("a")
        graph.add("b")
        graph.add("c")
        XCTAssertEqual("a", graph.node.value)
        XCTAssertEqual(2, graph.node.vertex.count)
        XCTAssertEqual("b", graph.node.vertex.first!.node.value)
        XCTAssertTrue(graph.node.vertex.first!.node.vertex.isEmpty)
        XCTAssertEqual("c", graph.node.vertex.last!.node.value)
        XCTAssertTrue(graph.node.vertex.first!.node.vertex.isEmpty)
        XCTAssertNotEqual(graph.node.vertex.first!.input, graph.node.vertex.last!.input)
    }
    
    func test4Nodes() {
        graph.add("a")
        graph.add("b")
        graph.add("c")
        graph.add("d")
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
        graph.add("a")
        graph.add("b")
        graph.add("c")
        graph.add("d")
        graph.add("e")
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
        graph.add("a")
        graph.add("b")
        graph.add("c")
        graph.add("d")
        graph.add("e")
        graph.add("f")
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
        graph.add("a")
        graph.add("b")
        graph.add("c")
        graph.add("d")
        graph.add("e")
        graph.add("f")
        graph.add("g")
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
        graph.add("a")
        graph.add("b")
        graph.add("c")
        graph.add("d")
        graph.add("e")
        graph.add("f")
        graph.add("g")
        graph.add("h")
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
