class Graph {
    private(set) var route = [Vertex]()
    
    init(_ message: String, level: Level) {
        message.map({ String($0) }).forEach { route.append ({
            route.isEmpty ? Vertex($1) : {
                $0.node = $1
                return $0
            } (route.last!.node!.vertex.first(where: { $0.node == nil })!, $1)
        } ($0, Node($0, size: level.lanes.count > 1 ? 2 : 1)))}
    }
}
