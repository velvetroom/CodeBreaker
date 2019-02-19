class Graph {
    let node = Node()
    
    init(_ message: String) {
        message.map( { String($0) } ).forEach {
            if node.value.isEmpty {
                node.value = $0
            } else {
                node.add($0)
            }
        }
    }
}
