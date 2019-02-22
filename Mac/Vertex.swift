import AppKit

class Vertex: CAShapeLayer {
    weak var destination: Node?
    private(set) weak var origin: Node!
    
    init(_ origin: Node) {
        super.init()
        self.origin = origin
        lineWidth = 10
        strokeColor = NSColor.white.cgColor
    }
    
    required init?(coder: NSCoder) { return nil }
    
    func move(_ to: CGPoint) {
        path = {
            $0.move(to: CGPoint(x: origin.frame.midX, y: origin.frame.midY))
            $0.addLine(to: CGPoint(x: to.x, y: App.shared.frame.height - to.y))
            return $0
        } (CGMutablePath())
    }
}
