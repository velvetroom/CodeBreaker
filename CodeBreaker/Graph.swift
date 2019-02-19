class Graph {
    let vertex = Vertex()
    let size: Int
    
    init(_ message: String, level: Level) {
        size = level.lanes.count > 1 ? 2 : 1
        message.map( { String($0) } ).forEach { node(vertex).0.node = Node($0, size: size) }
    }
    
    private func node(_ vertex: Vertex) -> (Vertex, Int) {
        return vertex.node == nil ? (vertex, 0) : {
            ($0.0, $0.1 + 1)
        } (vertex.node!.vertex.map({ node($0) }).sorted(by: { $0.1 < $1.1 }).first!)
    }
}
