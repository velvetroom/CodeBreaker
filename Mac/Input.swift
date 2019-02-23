import AppKit

class Input: NSControl {
    private(set) weak var field: NSTextField!
    
    init(_ value: Int, target: AnyObject, action: Selector) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        wantsLayer = true
        layer!.backgroundColor = NSColor.white.cgColor
        layer!.cornerRadius = 13
        self.target = target
        self.action = action
        
        let field = NSTextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.alignment = .center
        field.font = .bold(14)
        field.textColor = .black
        field.backgroundColor = .clear
        field.isBezeled = false
        field.isEditable = false
        field.stringValue = String(value)
        addSubview(field)
        self.field = field
        
        widthAnchor.constraint(equalToConstant: 26).isActive = true
        heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        field.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        field.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -1).isActive = true
    }
    
    required init?(coder: NSCoder) { return nil }
    override func mouseDown(with: NSEvent) { sendAction(action, to: target) }
}
