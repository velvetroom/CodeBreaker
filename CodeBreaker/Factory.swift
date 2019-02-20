class Factory {
    class func mission(_ text: String, level: Level) -> Mission {
        var mission = Mission()
        mission.text = text
        mission.cypher = text.reduce(into: String()) { $0 += Alphabet.map[String($1)]! }
        mission.code = Graph(text, level: level).code
        return mission
    }
}
