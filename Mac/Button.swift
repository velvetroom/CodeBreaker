import AppKit

class Button: NSButton {
    init(_ image: String, target: AnyObject, action: Selector) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setButtonType(.momentaryChange)
        imageScaling = .scaleNone
        isBordered = false
        self.image = NSImage(named: image)
        self.target = target
        self.action = action
    }
    
    required init?(coder: NSCoder) { return nil }
}
