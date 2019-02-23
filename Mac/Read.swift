import AppKit

class Read: NSView {
    init(_ code: [Int]) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        wantsLayer = true
        layer!.backgroundColor = NSColor.shade.cgColor
        layer!.cornerRadius = 4
        
        heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        var left = leftAnchor
        code.forEach {
            let label = Label(String($0), font: .bold(16), align: .center)
            label.wantsLayer = true
            label.layer!.backgroundColor = NSColor.black.cgColor
            label.layer!.cornerRadius = 4
            addSubview(label)
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            label.widthAnchor.constraint(equalToConstant: 30).isActive = true
            label.heightAnchor.constraint(equalToConstant: 30).isActive = true
            label.leftAnchor.constraint(equalTo: left, constant:5).isActive = true
            left = label.rightAnchor
        }
        rightAnchor.constraint(equalTo: left, constant: 5).isActive = true
    }
    
    required init?(coder: NSCoder) { return nil }
}
