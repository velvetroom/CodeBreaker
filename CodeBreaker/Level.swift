protocol Level: Codable {
    var lanes: [Int] { get }
    var size: Int { get }
    init()
}

extension Level {
    var size: Int { return lanes.count > 1 ? 2 : 1 }
}
