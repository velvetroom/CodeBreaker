import AppKit
import Breaker

class Terminal: NSScrollView {
    private weak var dragging: NSView?
    private let mission: Mission
    private let separation = CGFloat(100)
    
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
        
        (1 ... mission.horizontal).forEach { x in
            (0 ..< mission.vertical).forEach { y in
                let node = Node()
                documentView!.addSubview(node)
                
                node.leftAnchor.constraint(equalTo: leftAnchor, constant: separation * CGFloat(x)).isActive = true
                node.centerYAnchor.constraint(equalTo: centerYAnchor, constant: separation * CGFloat(y)).isActive = true
                documentView!.rightAnchor.constraint(greaterThanOrEqualTo: node.rightAnchor, constant: separation).isActive = true
            }
        }
    }
    
    required init?(coder: NSCoder) { return nil }
    
    override func mouseDown(with: NSEvent) {
        stopEdit()
        node(hitTest(with.locationInWindow))?.click()
    }
    
    private func node(_ view: NSView?) -> Node? { return view is Node ? view as? Node : view == nil ? nil : node(view!.superview) }
    
    private func stopEdit() { documentView!.subviews.compactMap({ $0 as? Node }).forEach { $0.stop() } }
}
