import Foundation

class Factory {
    class func mission(_ player: Player) -> Mission {
        return {
            var mission = Mission()
            mission.text = $0
            mission.cypher = $0.map { Alphabet.map[String($0)]! }
            mission.alphabet = mission.cypher.reduce(into: []) { if !$0.contains($1) { $0.append($1) } }
            mission.code = Graph($0, level: player.level).code
            mission.vertical = player.level.lanes.count
            mission.horizontal = Int(ceil(Float($0.count) / Float(mission.vertical))) + mission.vertical - 1
            mission.size = player.level.size
            return mission
        } (Codes.list[player.code + 1])
    }
}
