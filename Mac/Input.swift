import AppKit

class Input: NSControl {
    private(set) weak var field: NSTextField!
    
    init(_ value: Int) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        wantsLayer = true
        layer!.backgroundColor = NSColor.white.cgColor
        layer!.cornerRadius = 18
        
        let field = NSTextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.alignment = .center
        field.font = .bold(18)
        field.textColor = .black
        field.backgroundColor = .clear
        field.isBezeled = false
        field.isEditable = false
        field.stringValue = String(value)
        addSubview(field)
        self.field = field
        
        widthAnchor.constraint(equalToConstant: 36).isActive = true
        heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        field.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        field.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -1).isActive = true
    }
    
    required init?(coder: NSCoder) { return nil }
}
