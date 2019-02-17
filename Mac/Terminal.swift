import AppKit

class Terminal: NSScrollView {
    static let shared = Terminal()
    
    private init() {
        super.init(frame: .zero)
        drawsBackground = false
        translatesAutoresizingMaskIntoConstraints = false
        documentView = NSView()
        documentView!.translatesAutoresizingMaskIntoConstraints = false
        documentView!.wantsLayer = true
        documentView!.topAnchor.constraint(equalTo: topAnchor).isActive = true
        documentView!.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        documentView!.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor).isActive = true
        documentView!.rightAnchor.constraint(greaterThanOrEqualTo: rightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) { return nil }
    
    func prepare(_ length: Int) {
        documentView!.subviews.forEach { $0.removeFromSuperview() }
        for i in 1 ... length {
            add(CGFloat(i))
        }
    }
    
    private func add(_ x: CGFloat) {
        let center = Node()
        let top = Node()
        let down = Node()
        
        documentView!.addSubview(center)
        documentView!.addSubview(top)
        documentView!.addSubview(down)
        
        center.leftAnchor.constraint(equalTo: leftAnchor, constant: 100 * x).isActive = true
        center.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        top.leftAnchor.constraint(equalTo: leftAnchor, constant: 100 * x).isActive = true
        top.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100).isActive = true
        
        down.leftAnchor.constraint(equalTo: leftAnchor, constant: 100 * x).isActive = true
        down.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 100).isActive = true
        
        documentView!.rightAnchor.constraint(greaterThanOrEqualTo: center.rightAnchor, constant: 100).isActive = true
    }
}
