import AppKit

protocol State {
    func update(_: Node!)
    func click(_: Node!)
    func stop(_: Node!)
    func select(_: Emoji, _: Node!)
}

extension State {
    func stop(_: Node!) { }
    func select(_: Emoji, _: Node! = nil) { }
}

class Node: NSView, State {
    fileprivate var state:State! { didSet { state.update(self) } }
    fileprivate weak var emoji: Emoji!
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        layer = {
            $0.path = .init(ellipseIn: CGRect(x: 10, y: 10, width: 40, height: 40), transform: nil)
            return $0
        } (CAShapeLayer())
        wantsLayer = true
        
        let emoji = Emoji()
        addSubview(emoji)
        self.emoji = emoji
        
        widthAnchor.constraint(equalToConstant: 60).isActive = true
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        emoji.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emoji.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        DispatchQueue.main.async { [weak self] in self?.state = None() }
    }
    
    required init?(coder: NSCoder) { return nil }
    func update(_: Node! = nil) { state.update(self) }
    func click(_: Node! = nil) { state.click(self) }
    func stop(_: Node! = nil) { state.stop(self) }
    func select(_ emoji: Emoji, _: Node! = nil) { state.select(emoji, self) }
}

private class None: State {
    fileprivate func update(_ node: Node!) {
        (node.layer as! CAShapeLayer).lineWidth = 0
        (node.layer as! CAShapeLayer).strokeColor = NSColor.clear.cgColor
        (node.layer as! CAShapeLayer).fillColor = NSColor(white: 1, alpha: 0.25).cgColor
    }
    
    fileprivate func click(_ node: Node!) {
        node.state = Edit()
        Alphabet(node)
    }
}

private class Edit: State {
    fileprivate func update(_ node: Node!) {
        (node.layer as! CAShapeLayer).lineWidth = 1
        (node.layer as! CAShapeLayer).strokeColor = NSColor.white.cgColor
        (node.layer as! CAShapeLayer).fillColor = NSColor(white: 1, alpha: 0.7).cgColor
    }
    
    fileprivate func click(_ node: Node!) {
        
    }
    
    fileprivate func stop(_ node: Node!) {
        node.state = node.emoji.stringValue.isEmpty ? None() : Code()
    }
    
    fileprivate func select(_ emoji: Emoji, _ node: Node!) {
        node.emoji.stringValue = emoji.stringValue
        node.state = Code()
    }
}

private class Code: State {
    fileprivate func update(_ node: Node!) {
        (node.layer as! CAShapeLayer).lineWidth = 3
        (node.layer as! CAShapeLayer).strokeColor = NSColor.white.cgColor
        (node.layer as! CAShapeLayer).fillColor = NSColor(white: 1, alpha: 0.1).cgColor
    }
    
    fileprivate func click(_ node: Node!) {
        node.state = Edit()
        Alphabet(node)
    }
}
