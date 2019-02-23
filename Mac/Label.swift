import AppKit

class Label: NSTextField {
    init(_ string: String = String(), color: NSColor = NSColor.white, font: NSFont? = NSFont.light(16)) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        textColor = color
        isBezeled = false
        isEditable = false
        stringValue = string
        self.font = font
    }
    
    required init?(coder: NSCoder) { return nil }
}
