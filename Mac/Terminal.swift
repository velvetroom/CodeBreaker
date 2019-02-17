import AppKit
import Breaker

class Terminal: NSScrollView {
    static let shared = Terminal()
    private let separation = CGFloat(100)
    
    private init() {
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
    }
    
    required init?(coder: NSCoder) { return nil }
    
    func prepare(_ length: Int) {
        documentView!.subviews.forEach { $0.removeFromSuperview() }
        (1 ... length).forEach { add(CGFloat($0)) }
    }
    
    private func add(_ x: CGFloat) {
        Breaker.shared.player.level.lanes.forEach {
            let node = Node()
            documentView!.addSubview(node)
            
            node.leftAnchor.constraint(equalTo: leftAnchor, constant: separation * x).isActive = true
            node.centerYAnchor.constraint(equalTo: centerYAnchor, constant: separation * CGFloat($0)).isActive = true
            documentView!.rightAnchor.constraint(greaterThanOrEqualTo: node.rightAnchor, constant: separation).isActive = true
        }
    }
}
