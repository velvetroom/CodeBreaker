class Node {
    let vertex: [Vertex]
    let value: String
    
    init(_ state: String, size: Int) {
        value = state
        vertex = { size > 1 ? (0 ..< size).map({ Vertex($0) }).shuffled() : [Vertex()] } ()
    }
}
