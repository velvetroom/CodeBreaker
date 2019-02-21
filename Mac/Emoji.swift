import AppKit

class Emoji: NSTextField {
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        alignment = .center
        font = .systemFont(ofSize: 35)
        backgroundColor = .clear
        isBezeled = false
        isEditable = false
    }
    
    required init?(coder: NSCoder) { return nil }
}
