class Graph {
    private(set) var route = [Vertex]()
    
    init(_ message: String, level: Level) {
        message.map({ String($0) }).enumerated().forEach { route.append ({
            route.isEmpty ? Vertex($1) : {
                $0.node = $1
                return $0
            } (route.last!.node!.vertex.first(where: { $0.node == nil })!, $1)
        } ($0.1, { c in
            route.first(where: { $0.node?.state == c.1 &&
                (c.0 == message.count - 1 ||
                    { ($1 > 0 && $0 !== route.last) || $1 > 1 } ($0, $0.node!.vertex.filter({ $0.node == nil }).count)
                ) })?.node ??
                Node(c.1, size: level.lanes.count > 1 ? 2 : 1)
        } ($0) ))}
    }
}
