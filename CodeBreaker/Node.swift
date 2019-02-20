class Node {
    let vertex: [Vertex]
    let state: String
    
    init(_ state: String, size: Int) {
        vertex = { size > 1 ? (0 ..< size).map({ Vertex(input: $0) }).shuffled() : [Vertex()] } ()
        self.state = state
    }
}
