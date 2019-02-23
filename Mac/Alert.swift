import AppKit

class Alert: Sheet {
    @discardableResult init(_ message: String) {
        super.init()
        layer!.backgroundColor = NSColor(white: 0, alpha: 0.9).cgColor
        
        let label = Label(message, font: .bold(20), align: .center)
        addSubview(label)
        
        let close = Button("back", target: self, action: #selector(self.close))
        addSubview(close)
        
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.widthAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
        
        close.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        close.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
    }
    
    required init?(coder: NSCoder) { return nil }
}
