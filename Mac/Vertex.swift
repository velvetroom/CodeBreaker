import AppKit

class Vertex: CAShapeLayer {
    weak var prospect: Node? { willSet { prospect?.stop() } didSet { prospect?.drag() } }
    private(set) weak var input: Input?
    private(set) weak var destination: Node?
    private(set) weak var origin: Node!
    
    init(_ origin: Node) {
        super.init()
        self.origin = origin
        lineWidth = 14
        lineCap = .round
        strokeColor = NSColor.white.cgColor
    }
    
    required init?(coder: NSCoder) { return nil }
    
    func move(_ to: CGPoint) {
        path = {
            $0.move(to: CGPoint(x: origin.frame.midX, y: origin.frame.midY))
            $0.addLine(to: App.shared.terminal!.convert(to, from: App.shared.contentView))
            return $0
        } (CGMutablePath())
    }
    
    func connect() {
        origin.stop()
        prospect == nil ? remove() : add()
    }
    
    func clear() {
        removeFromSuperlayer()
        input?.removeFromSuperview()
    }
    
    private func remove() {
        add({
            $0.toValue = {
                $0.move(to: CGPoint(x: origin.frame.midX, y: origin.frame.midY))
                $0.addLine(to: CGPoint(x: origin.frame.midX, y: origin.frame.midY))
                return $0
            } (CGMutablePath())
            $0.fillMode = .forwards
            $0.isRemovedOnCompletion = false
            $0.duration = 0.4
            return $0
        } (CABasicAnimation(keyPath: "path")), forKey: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in self?.clear() }
    }
    
    private func add() {
        destination = prospect
        prospect = nil
        path = {
            $0.move(to: CGPoint(x: origin.frame.midX, y: origin.frame.midY))
            $0.addLine(to: CGPoint(x: destination!.frame.midX, y: destination!.frame.midY))
            return $0
        } (CGMutablePath())
        let input = Input(App.shared.terminal!.layer!.sublayers!.compactMap({ $0 as? Vertex })
            .filter({ $0.origin === origin && $0 !== self }).reduce(0, { Int($1.input!.label.stringValue) == 0 ? 1 : 0 }),
                          target: self, action: #selector(code))
        App.shared.terminal!.documentView!.addSubview(input)
        self.input = input
        
        if origin.frame.midX == destination!.frame.midX {
            input.centerXAnchor.constraint(equalTo: origin.centerXAnchor).isActive = true
        } else if origin.frame.midX > destination!.frame.midX {
            input.rightAnchor.constraint(equalTo: origin.leftAnchor, constant: 11).isActive = true
        } else {
            input.leftAnchor.constraint(equalTo: origin.rightAnchor, constant: -11).isActive = true
        }
        
        if origin.frame.midY == destination!.frame.midY {
            input.centerYAnchor.constraint(equalTo: origin.centerYAnchor).isActive = true
        } else if origin.frame.midY > destination!.frame.midY {
            input.topAnchor.constraint(equalTo: origin.bottomAnchor, constant: -11).isActive = true
        } else {
            input.bottomAnchor.constraint(equalTo: origin.topAnchor, constant: 11).isActive = true
        }
    }
    
    @objc private func code() { Codes(self) }
}
