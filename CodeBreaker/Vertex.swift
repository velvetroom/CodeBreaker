class Vertex {
    var node: Node?
    let input: Int
    
    init(_ input: Int = .random(in: 0 ... 1)) {
        self.input = input
    }
}
