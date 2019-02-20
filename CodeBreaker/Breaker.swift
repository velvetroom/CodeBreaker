public class Breaker {
    public static let shared = Breaker()
    public let player = Player()
    public var mission: Mission { return Factory.mission(player) }
}
