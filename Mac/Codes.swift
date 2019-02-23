import AppKit

class Codes: Sheet {
    private weak var vertex: Vertex!
    
    @discardableResult init(_ vertex: Vertex) {
        super.init()
        layer!.backgroundColor = NSColor.black.cgColor
        self.vertex = vertex
        
        let zero = Link("0", target: self, action: #selector(self.zero))
        addSubview(zero)
        
        let one = Link("1", target: self, action: #selector(self.one))
        one.isHidden = App.shared.terminal!.mission.size < 2
        addSubview(one)
        
        let remove = Link(.local("Codes.remove"), target: self, action: #selector(self.remove))
        addSubview(remove)
        
        let close = Button("back", target: self, action: #selector(self.close))
        addSubview(close)
        
        zero.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        zero.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -50).isActive = true
        
        one.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        one.topAnchor.constraint(equalTo: zero.bottomAnchor, constant: 10).isActive = true
        
        remove.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        remove.topAnchor.constraint(equalTo: one.bottomAnchor, constant: 10).isActive = true
        
        close.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        close.topAnchor.constraint(equalTo: remove.bottomAnchor, constant: 30).isActive = true
    }
    
    required init?(coder: NSCoder) { return nil }
    
    @objc private func zero() {
        close()
        vertex.input!.label.stringValue = "0"
    }
    
    @objc private func one() {
        close()
        vertex.input!.label.stringValue = "1"
    }
    
    @objc private func remove() {
        close()
        vertex.clear()
    }
}
