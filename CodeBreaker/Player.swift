import Foundation

public class Player: Codable {
    var level: Level = Rookie()
    var code = -1
    private var levelType = String()
    
    public init() { }
    
    public required init(from: Decoder) throws {
        try {
            level = (NSClassFromString(try $0.decode(String.self, forKey: .level)) as! Level.Type).init()
            code = try $0.decode(Int.self, forKey: .code)
        } (try from.container(keyedBy: Keys.self))
    }
    
    public func encode(to: Encoder) throws {
        var container = to.container(keyedBy: Keys.self)
        try container.encode(String(describing: level), forKey: .level)
        try container.encode(code, forKey: .code)
    }
    
    private enum Keys: CodingKey {
        case level
        case code
    }
}
