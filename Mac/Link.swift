import AppKit

class Link: NSButton {
    init(_ title: String, target: AnyObject, action: Selector) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        wantsLayer = true
        layer!.backgroundColor = NSColor.shade.cgColor
        layer!.cornerRadius = 6
        setButtonType(.momentaryChange)
        isBordered = false
        attributedTitle = NSAttributedString(string: title, attributes: [.font:
            NSFont.bold(16), .foregroundColor: NSColor(white: 1, alpha: 0.6)])
        widthAnchor.constraint(equalToConstant: 108).isActive = true
        heightAnchor.constraint(equalToConstant: 38).isActive = true
        self.target = target
        self.action = action
    }
    
    required init?(coder: NSCoder) { return nil }
}
