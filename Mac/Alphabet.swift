import AppKit

class Alphabet: Sheet {
    private weak var node: Node!
    
    @discardableResult init(_ node: Node) {
        super.init()
        layer!.backgroundColor = NSColor(white: 0, alpha: 0.8).cgColor
        self.node = node
        
        let base = NSView()
        base.translatesAutoresizingMaskIntoConstraints = false
        base.wantsLayer = true
        base.layer!.backgroundColor = NSColor(white: 0.1, alpha: 0.9).cgColor
        base.layer!.borderColor = NSColor(white: 0.2, alpha: 0.9).cgColor
        base.layer!.borderWidth = 1
        base.layer!.cornerRadius = 60
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
        
        base.topAnchor.constraint(equalTo: scroll.topAnchor, constant: -20).isActive = true
        base.bottomAnchor.constraint(equalTo: scroll.bottomAnchor, constant: 20).isActive = true
        base.leftAnchor.constraint(equalTo: scroll.leftAnchor, constant: -20).isActive = true
        base.rightAnchor.constraint(equalTo: scroll.rightAnchor, constant: 20).isActive = true
        
        scroll.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        scroll.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        scroll.heightAnchor.constraint(equalToConstant: 80).isActive = true
        scroll.widthAnchor.constraint(lessThanOrEqualToConstant: 540).isActive = true
        
        close.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        close.topAnchor.constraint(equalTo: base.bottomAnchor, constant: 50).isActive = true
        
        var left = scroll.documentView!.leftAnchor
        App.shared.terminal!.mission.alphabet.forEach {
            let option = Option($0, target: self, action: #selector(option(_:)))
            scroll.documentView!.addSubview(option)
            
            option.leftAnchor.constraint(equalTo: left, constant: 20).isActive = true
            option.centerYAnchor.constraint(equalTo: scroll.centerYAnchor).isActive = true
            left = option.rightAnchor
        }
        scroll.documentView!.rightAnchor.constraint(equalTo: left, constant: 20).isActive = true
    }
    
    required init?(coder: NSCoder) { return nil }
    
    override func close() {
        super.close()
        node.stop()
    }
    
    @objc private func option(_ option: Option) {
        node.select(option.emoji)
        close()
    }
}
