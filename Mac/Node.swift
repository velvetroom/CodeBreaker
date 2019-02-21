import AppKit

class Node: NSView {
    enum State {
        case none
        case set
        case connected
        case start
    }
    
    private(set) var state = State.none { didSet { update() } }
    private weak var field: NSTextField!
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        layer = {
            $0.path = .init(ellipseIn: CGRect(x: 10, y: 10, width: 40, height: 40), transform: nil)
            return $0
        } (CAShapeLayer())
        wantsLayer = true
        
        let field = NSTextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.alignment = .center
        field.font = .systemFont(ofSize: 35)
        field.backgroundColor = .clear
        field.isBezeled = false
        field.isEditable = false
        addSubview(field)
        self.field = field
        
        widthAnchor.constraint(equalToConstant: 60).isActive = true
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        field.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        field.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        update()
    }
    
    required init?(coder: NSCoder) { return nil }
    
    private func update() {
        switch state {
        case .none:
            (layer as! CAShapeLayer).lineWidth = 0
            (layer as! CAShapeLayer).strokeColor = NSColor.clear.cgColor
            (layer as! CAShapeLayer).fillColor = NSColor(white: 1, alpha: 0.3).cgColor
        case .set:
            (layer as! CAShapeLayer).lineWidth = 3
            (layer as! CAShapeLayer).strokeColor = NSColor.white.cgColor
            (layer as! CAShapeLayer).fillColor = NSColor(white: 1, alpha: 0.1).cgColor
        case .connected:
            (layer as! CAShapeLayer).lineWidth = 3
            (layer as! CAShapeLayer).strokeColor = NSColor.white.cgColor
            (layer as! CAShapeLayer).fillColor = NSColor(white: 1, alpha: 0.1).cgColor
        case .start:
            (layer as! CAShapeLayer).lineWidth = 3
            (layer as! CAShapeLayer).strokeColor = NSColor.white.cgColor
            (layer as! CAShapeLayer).fillColor = NSColor(white: 1, alpha: 0.1).cgColor
        }
    }
}
