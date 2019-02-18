class Node {
    let vertex: [Vertex]
    
    init() {
        if Int.random(in: 0 ... 1) == 0 {
            vertex = [Vertex(0), Vertex(1)]
        } else {
            vertex = [Vertex(1), Vertex(0)]
        }
    }
}
