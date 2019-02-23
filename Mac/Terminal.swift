import AppKit
import Breaker

class Terminal: NSScrollView {
    let mission: Mission
    private weak var start: Node!
    private weak var read: Read!
    private weak var buttonPlay: Button!
    private weak var buttonStop: Button!
    private let separation = CGFloat(200)
    
    init(_ mission: Mission) {
        self.mission = mission
        super.init(frame: .zero)
        drawsBackground = false
        translatesAutoresizingMaskIntoConstraints = false
        verticalScrollElasticity = .none
        documentView = NSView()
        documentView!.translatesAutoresizingMaskIntoConstraints = false
        documentView!.topAnchor.constraint(equalTo: topAnchor).isActive = true
        documentView!.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        documentView!.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        documentView!.rightAnchor.constraint(greaterThanOrEqualTo: rightAnchor).isActive = true
        
        let start = NSView()
        start.translatesAutoresizingMaskIntoConstraints = false
        start.wantsLayer = true
        start.layer!.backgroundColor = NSColor.halo.cgColor
        start.layer!.cornerRadius = 4
        documentView!.addSubview(start)
        
        (1 ... mission.horizontal).forEach { x in
            (0 ..< mission.vertical).forEach { y in
                let node = Node()
                self.start = self.start == nil ? node : self.start
                documentView!.addSubview(node)
                
                node.leftAnchor.constraint(equalTo: leftAnchor, constant: separation * CGFloat(x)).isActive = true
                node.centerYAnchor.constraint(equalTo: centerYAnchor, constant: separation * CGFloat(y)).isActive = true
                documentView!.rightAnchor.constraint(greaterThanOrEqualTo: node.rightAnchor, constant: separation).isActive = true
            }
        }
        
        let read = Read(mission.code)
        documentView!.addSubview(read)
        self.read = read
        
        let buttonPlay = Button("play", target: self, action: #selector(play))
        buttonPlay.keyEquivalent = "\r"
        buttonPlay.keyEquivalentModifierMask = .command
        documentView!.addSubview(buttonPlay)
        self.buttonPlay = buttonPlay
        
        let buttonStop = Button("stop", target: self, action: #selector(stop))
        buttonStop.isEnabled = false
        buttonStop.keyEquivalent = "\u{1b}"
        documentView!.addSubview(buttonStop)
        self.buttonStop = buttonStop
        
        widthAnchor.constraint(equalToConstant: 800).isActive = true
        heightAnchor.constraint(equalToConstant: 600).isActive = true
        
        start.heightAnchor.constraint(equalToConstant: 8).isActive = true
        start.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        start.rightAnchor.constraint(equalTo: self.start.centerXAnchor).isActive = true
        start.centerYAnchor.constraint(equalTo: self.start.centerYAnchor).isActive = true
        
        read.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        read.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        buttonPlay.topAnchor.constraint(equalTo: read.bottomAnchor, constant: 5).isActive = true
        buttonPlay.leftAnchor.constraint(equalTo: read.leftAnchor).isActive = true
        
        buttonStop.topAnchor.constraint(equalTo: read.bottomAnchor, constant: 5).isActive = true
        buttonStop.leftAnchor.constraint(equalTo: buttonPlay.rightAnchor, constant: 5).isActive = true
    }
    
    required init?(coder: NSCoder) { return nil }
    
    override func mouseDown(with: NSEvent) {
        guard buttonPlay.isEnabled else { return }
        documentView!.subviews.compactMap({ $0 as? Node }).forEach { $0.stop() }
        node(hitTest(with.locationInWindow))?.click()
    }
    
    override func mouseDragged(with: NSEvent) {
        guard buttonPlay.isEnabled else { return }
        guard let vertex = layer!.sublayers!.compactMap({ $0 as? Vertex }).filter({ $0.destination == nil }).first else { return }
        vertex.prospect = { $0?.prospect == true ? $0 : nil } (node(hitTest(with.locationInWindow)))
        vertex.move(with.locationInWindow)
    }
    
    override func mouseUp(with: NSEvent) {
        layer!.sublayers!.compactMap({ $0 as? Vertex }).filter({ $0.destination == nil }).forEach({ $0.connect() })
    }
    
    private func node(_ view: NSView?) -> Node? { return view is Node ? view as? Node : view == nil ? nil : node(view!.superview) }
    
    @objc private func play() {
        buttonPlay.isEnabled = false
        buttonStop.isEnabled = true
    }
    
    @objc private func stop() {
        buttonPlay.isEnabled = true
        buttonStop.isEnabled = false
    }
}
