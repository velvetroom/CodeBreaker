import AppKit

class Input: NSControl {
    private(set) weak var label: Label!
    
    init(_ value: Int, target: AnyObject, action: Selector) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        wantsLayer = true
        layer!.backgroundColor = NSColor.white.cgColor
        layer!.cornerRadius = 13
        self.target = target
        self.action = action
        
        let label = Label(String(value), color: .black, font: .bold(14), align: .center)
        addSubview(label)
        self.label = label
        
        widthAnchor.constraint(equalToConstant: 26).isActive = true
        heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -1).isActive = true
    }
    
    required init?(coder: NSCoder) { return nil }
    override func mouseDown(with: NSEvent) { sendAction(action, to: target) }
}
