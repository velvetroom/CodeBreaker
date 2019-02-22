class Graph {
    var code: [Int] { return route.enumerated().compactMap { $0.0 > 0 ? $0.1.input : nil } }
    private(set) var route = [Vertex]()
    
    init(_ message: String, level: Level) {
        message.map({ String($0) }).enumerated().forEach { route.append ({
            route.isEmpty ? Vertex($1) : {
                $0.node = $1
                return $0
            } (route.last!.node!.vertex.first(where: { $0.node == nil })!, $1)
        } ($0.1, { c in
            route.compactMap({ $0.node?.state == c.1 ? $0.node : nil })
                .filter({ {
                    $2 > 1 || ($2 > 0 && ($0 == message.count - 1 || $1 !== route.last?.node))
                } (c.0, $0, $0.vertex.filter({ $0.node == nil }).count) }).first ??
                Node(c.1, size: level.size)
        } ($0) ))}
    }
}
