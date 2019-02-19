class Graph {
    let node = Node()
    let max: Int
    
    init(_ message: String, level: Level) {
        max = level.lanes.count > 1 ? 2 : 1
        message.map( { String($0) } ).forEach {
            /*if node.value.isEmpty {
                node.value = $0
            } else {
                add(node, state: $0)
            }*/
            
            
//            ({
//                return node.value.isEmpty ? node : {
//                    $1.vertex.count < 2 ? $1.vertex.append( {
//
//                    } (Vertex())) : {
//                        $1.vertex.first!.node
//                    } ($0, $1)
//                } ($0, node)
//            } ($0) as Node).value = $0
        }
    }
    
    private func add(_ node: Node, state: String) {
        if node.vertex.count < 2 {
            node.vertex.append({
                $0.node.value = state
                $0.input = node.vertex.isEmpty ?
                    .random(in: 0 ... 1) :
                    node.vertex.first!.input == 0 ? 1 : 0
                return $0
                } (Vertex()))
        } else if deep(node.vertex.first!.node, state: state) > deep(node.vertex.last!.node, state: state) {
            add(node.vertex.last!.node, state: state)
        } else {
            add(node.vertex.first!.node, state: state)
        }
    }
    
    private func deep(_ node: Node, state: String) -> Int {
        var count = 1
        if node.vertex.count > 1 {
            count += min(deep(node.vertex.first!.node, state: state), deep(node.vertex.last!.node, state: state))
        }
        return count
    }
}
