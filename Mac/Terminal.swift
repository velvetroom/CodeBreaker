import AppKit

class Terminal: NSScrollView {
    static let shared = Terminal()
    
    private init() {
        super.init(frame: .zero)
        drawsBackground = false
        translatesAutoresizingMaskIntoConstraints = false
        documentView = NSView()
        documentView!.translatesAutoresizingMaskIntoConstraints = false
        documentView!.wantsLayer = true
        documentView!.topAnchor.constraint(equalTo: topAnchor).isActive = true
        documentView!.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        documentView!.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor).isActive = true
        documentView!.rightAnchor.constraint(greaterThanOrEqualTo: rightAnchor).isActive = true
        addNode(.zero)
    }
    
    required init?(coder: NSCoder) { return nil }
    
    func addNode(_ position: CGPoint) {
        let node = Node("🚀")
        documentView!.addSubview(node)
        node.centerXAnchor.constraint(equalTo: documentView!.centerXAnchor).isActive = true
        node.centerYAnchor.constraint(equalTo: documentView!.centerYAnchor).isActive = true
    }
}
