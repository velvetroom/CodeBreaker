class Vertex {
    var node: Node?
    let input: Int
    
    init(_ node: Node? = nil, input: Int = .random(in: 0 ... 1)) {
        self.node = node
        self.input = input
    }
}
