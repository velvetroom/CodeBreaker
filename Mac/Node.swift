import AppKit

class Node: NSView {
    private weak var field: NSTextField!
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        layer = {
            $0.path = .init(ellipseIn: CGRect(x: 10, y: 10, width: 40, height: 40), transform: nil)
            $0.lineWidth = 3
            $0.strokeColor = NSColor.white.cgColor
            $0.fillColor = NSColor(white: 1, alpha: 0.1).cgColor
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
        field.stringValue = "🏎"
        addSubview(field)
        self.field = field
        
        widthAnchor.constraint(equalToConstant: 60).isActive = true
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        field.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        field.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) { return nil }
}
