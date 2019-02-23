import AppKit

class Expected: NSView {
    init(_ cypher: [String]) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        wantsLayer = true
        layer!.backgroundColor = NSColor.shade.cgColor
        layer!.cornerRadius = 4
        
        heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        var left = leftAnchor
        cypher.forEach {
            let label = Label($0, font: .light(22), align: .center)
            label.wantsLayer = true
            label.layer!.backgroundColor = NSColor.black.cgColor
            label.layer!.cornerRadius = 4
            addSubview(label)
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            label.widthAnchor.constraint(equalToConstant: 35).isActive = true
            label.heightAnchor.constraint(equalToConstant: 35).isActive = true
            label.leftAnchor.constraint(equalTo: left, constant:5).isActive = true
            left = label.rightAnchor
        }
        rightAnchor.constraint(equalTo: left, constant: 5).isActive = true
    }
    
    required init?(coder: NSCoder) { return nil }
}
