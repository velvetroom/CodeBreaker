class Node {
    var vertex = [Vertex]()
    var value = String()
    
    func add(_ state: String) {
        if vertex.count < 2 {
            vertex.append({
                $0.node.value = state
                $0.input = vertex.isEmpty ?
                    .random(in: 0 ... 1) :
                    vertex.first!.input == 0 ? 1 : 0
                return $0
            } (Vertex()))
        } else if vertex.first!.node.deep(state) > vertex.last!.node.deep(state) {
            vertex.last!.node.add(state)
        } else {
            vertex.first!.node.add(state)
        }
    }
    
    func deep(_ state: String) -> Int {
        var count = 1
        if vertex.count > 1 {
            count += min(vertex.first!.node.deep(state), vertex.last!.node.deep(state))
        }
        return count
    }
}
