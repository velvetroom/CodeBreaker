class Graph {
    private(set) var route = [Vertex]()
    
    init(_ message: String, level: Level) {
        message.map({ String($0) }).forEach { route.append ({
            print($0)
            return $1
        } ($0, Vertex()) )}
    }
    
    
    /*
    init(_ message: String, level: Level) {
        message.map( { String($0) } ).forEach { route.append({
            $1.0.node = $1.1 ?? Node($0, size: level.lanes.count > 1 ? 2 : 1)
            return $1.0
        } ($0, node(vertex, state: $0))) }
    }
    
    private func node(_ vertex: Vertex, state: String) -> (Vertex, Node?, Int) {
        return vertex.node == nil ? (vertex, nil, 0) : ({
            ($0.0, nil, $0.2 + 1)
        } (vertex.node!.vertex.map({ node($0, state: state) }).sorted(by: { $0.2 < $1.2 }).first!))
    }
 
 */
}
