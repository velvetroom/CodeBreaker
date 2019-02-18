class Graph {
    let node = Node()
    
    func add(_ state: String) {
        assert(state.count == 1)
        if node.value.isEmpty {
            node.value = state
        } else {
            node.add(state)
        }
    }
}
