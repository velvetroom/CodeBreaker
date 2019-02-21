import AppKit

class Alphabet: Sheet {
    @discardableResult init(_ node: Node) {
        super.init()
        layer!.backgroundColor = NSColor(white: 0, alpha: 0.8).cgColor
        
        let base = NSView()
        base.translatesAutoresizingMaskIntoConstraints = false
        base.wantsLayer = true
        base.layer!.backgroundColor = NSColor(white: 0.1, alpha: 0.9).cgColor
        base.layer!.borderColor = NSColor(white: 0.2, alpha: 0.9).cgColor
        base.layer!.borderWidth = 1
        base.layer!.cornerRadius = 50
        addSubview(base)
        
        let scroll = NSScrollView()
        scroll.drawsBackground = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.verticalScrollElasticity = .none
        scroll.documentView = NSView()
        scroll.documentView!.translatesAutoresizingMaskIntoConstraints = false
        scroll.documentView!.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        scroll.documentView!.leftAnchor.constraint(equalTo: scroll.leftAnchor).isActive = true
        scroll.documentView!.bottomAnchor.constraint(equalTo: scroll.bottomAnchor).isActive = true
        scroll.documentView!.rightAnchor.constraint(greaterThanOrEqualTo: scroll.rightAnchor).isActive = true
        addSubview(scroll)
        
        let close = Link(.local("Alphabet.close"), target: self, action: #selector(self.close))
        close.target = self
        addSubview(close)
        
        base.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        base.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        base.heightAnchor.constraint(equalToConstant: 100).isActive = true
        base.widthAnchor.constraint(equalToConstant: 550).isActive = true
        
        close.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        close.topAnchor.constraint(equalTo: base.bottomAnchor, constant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) { return nil }
}
