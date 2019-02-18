class Factory {
    class func mission(_ text: String) -> Mission {
        var mission = Mission()
        mission.text = text
        mission.cypher = text.reduce(into: String()) { $0 += Alphabet.map[String($1)]! }
        return mission
    }
}
