import AppKit

private protocol State {
    func update(_: Node!)
    func click(_: Node!)
    func stop(_: Node!)
    func drag(_: Node!)
    func select(_: Emoji, _: Node!)
    func prospect(_: Vertex, _: Node!)
}

private extension State {
    func click(_: Node!) { }
    func stop(_: Node!) { }
    func drag(_: Node!) { }
    func select(_: Emoji, _: Node! = nil) { }
    func prospect(_: Vertex, _: Node!) { }
}

class Node: NSView, State {
    fileprivate var state: State! { didSet { state.update(self) } }
    fileprivate weak var emoji: Emoji!
    fileprivate weak var close: NSButton?
    
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
    func drag(_: Node! = nil) { state.drag(self) }
    func select(_ emoji: Emoji, _: Node! = nil) { state.select(emoji, self) }
    func prospect(_ vertex: Vertex, _: Node! = nil) { state.prospect(vertex, self) }
    
    @objc fileprivate func remove() {
        close!.removeFromSuperview()
        emoji.stringValue = String()
        App.shared.terminal!.layer!.sublayers!.compactMap({ $0 as? Vertex })
            .filter({ $0.origin === self || $0.destination === self }).forEach { $0.clear() }
        state = None()
    }
}

private class None: State {
    fileprivate func update(_ node: Node!) {
        (node.layer as! CAShapeLayer).lineWidth = 0
        (node.layer as! CAShapeLayer).strokeColor = NSColor.clear.cgColor
        (node.layer as! CAShapeLayer).fillColor = NSColor(white: 0.25, alpha: 1).cgColor
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
        (node.layer as! CAShapeLayer).fillColor = NSColor(white: 0.7, alpha: 1).cgColor
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
        (node.layer as! CAShapeLayer).fillColor = NSColor(white: 0.1, alpha: 1).cgColor
        
        let close = NSButton()
        close.translatesAutoresizingMaskIntoConstraints = false
        close.image = NSImage(named: "close")
        close.setButtonType(.momentaryChange)
        close.imageScaling = .scaleNone
        close.isBordered = false
        close.target = node
        close.action = #selector(node.remove)
        node.superview!.addSubview(close)
        node.close = close
        
        close.widthAnchor.constraint(equalToConstant: 30).isActive = true
        close.heightAnchor.constraint(equalToConstant: 30).isActive = true
        close.topAnchor.constraint(equalTo: node.topAnchor, constant: -10).isActive = true
        close.leftAnchor.constraint(equalTo: node.leftAnchor, constant: -10).isActive = true
    }
    
    fileprivate func click(_ node: Node!) {
        guard App.shared.terminal!.layer!.sublayers!.compactMap({ $0 as? Vertex }).filter({ $0.origin === node }).count <
            App.shared.terminal!.mission.size else { return }
        node.state = Drag()
        let vertex = Vertex(node)
        App.shared.terminal!.layer!.addSublayer(vertex)
    }
    
    fileprivate func drag(_ node: Node!) {
        node.state = Drop()
    }
    
    fileprivate func prospect(_ vertex: Vertex, _ node: Node!) {
        vertex.prospect = node
    }
}

private class Drag: State {
    fileprivate func update(_ node: Node!) {
        (node.layer as! CAShapeLayer).lineWidth = 4
        (node.layer as! CAShapeLayer).strokeColor = NSColor.halo.cgColor
        (node.layer as! CAShapeLayer).fillColor = NSColor.black.cgColor
        node.close!.removeFromSuperview()
    }
    
    fileprivate func stop(_ node: Node!) {
        node.state = Code()
    }
}

private class Drop: State {
    fileprivate func update(_ node: Node!) {
        (node.layer as! CAShapeLayer).lineWidth = 10
        (node.layer as! CAShapeLayer).strokeColor = NSColor.halo.cgColor
        (node.layer as! CAShapeLayer).fillColor = NSColor.halo.cgColor
        node.close!.removeFromSuperview()
    }
    
    fileprivate func stop(_ node: Node!) {
        node.state = Code()
    }
}
