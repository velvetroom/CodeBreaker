class Graph {
    var route = [Vertex]()
    let vertex = Vertex()
    
    init(_ message: String, level: Level) {
        message.map( { String($0) } ).forEach { route.append({
            $1.0.node = Node($0, size: level.lanes.count > 1 ? 2 : 1)
            return $1.0
        } ($0, node(vertex, state: $0))) }
    }
    
    private func node(_ vertex: Vertex, state: String) -> (Vertex, Int) {
        return vertex.node == nil ? (vertex, 0) : ({
            ($0.0, $0.1 + 1)
        } (vertex.node!.vertex.map({ node($0, state: state) }).sorted(by: { $0.1 < $1.1 }).first!))
    }
}
