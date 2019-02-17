import AppKit

class Node: NSView {
    init(_ emoji: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        layer = {
            $0.path = .init(ellipseIn: CGRect(x: 10, y: 10, width: 100, height: 100), transform: nil)
            $0.lineWidth = 8
            $0.strokeColor = NSColor.white.cgColor
            $0.fillColor = NSColor(white: 1, alpha: 0.1).cgColor
            return $0
        } (CAShapeLayer())
        wantsLayer = true
        
        let field = NSTextField()
        field.stringValue = emoji
        field.translatesAutoresizingMaskIntoConstraints = false
        field.alignment = .center
        field.font = .systemFont(ofSize: 50)
        field.backgroundColor = .clear
        field.isBezeled = false
        field.isEditable = false
        addSubview(field)
        
        widthAnchor.constraint(equalToConstant: 120).isActive = true
        heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        field.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        field.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) { return nil }
}
