import AppKit

class Option: NSControl {
    private(set) weak var emoji: Emoji!
    
    init(_ value: String, target: AnyObject, action: Selector) {
        super.init(frame: .zero)
        self.target = target
        self.action = action
        translatesAutoresizingMaskIntoConstraints = false
        wantsLayer = true
        layer!.cornerRadius = 35
        layer!.backgroundColor = NSColor.black.cgColor
        layer!.borderWidth = 4
        layer!.borderColor = NSColor.halo.cgColor
        
        let emoji = Emoji()
        emoji.stringValue = value
        emoji.alphaValue = 0.6
        addSubview(emoji)
        self.emoji = emoji
        
        widthAnchor.constraint(equalToConstant: 70).isActive = true
        heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        emoji.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emoji.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) { return nil }
    
    override func mouseDown(with: NSEvent) {
        layer!.backgroundColor = NSColor.halo.cgColor
        emoji.alphaValue = 1
        sendAction(action, to: target)
    }
    
    override func mouseUp(with: NSEvent) {
        layer!.backgroundColor = NSColor.black.cgColor
        emoji.alphaValue = 0.6
    }
}
