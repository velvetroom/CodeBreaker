import Foundation

public class Player: Codable {
    public var level: Level = Rookie() { didSet { print("asd") } }
    private var levelType = String()
    
    public init() { }
    
    public required init(from: Decoder) throws {
        let values = try from.container(keyedBy: Keys.self)
        level = (NSClassFromString(try values.decode(String.self, forKey: .level)) as! Level.Type).init()
    }
    
    public func encode(to: Encoder) throws {
        var container = to.container(keyedBy: Keys.self)
        try container.encode(String(describing: level), forKey: .level)
    }
    
    private enum Keys: CodingKey {
        case level
    }
}
