import AppKit

class Vertex: CAShapeLayer {
    weak var prospect: Node? { willSet { prospect?.stop() } didSet { prospect?.drag() } }
    private(set) weak var destination: Node?
    private(set) weak var origin: Node!
    
    init(_ origin: Node) {
        super.init()
        self.origin = origin
        lineWidth = 14
        lineCap = .round
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
    
    func connect() {
        origin.stop()
        prospect == nil ? remove() : add()
    }
    
    private func remove() {
        add({
            $0.toValue = {
                $0.move(to: CGPoint(x: origin.frame.midX, y: origin.frame.midY))
                $0.addLine(to: CGPoint(x: origin.frame.midX, y: origin.frame.midY))
                return $0
            } (CGMutablePath())
            $0.fillMode = .forwards
            $0.isRemovedOnCompletion = false
            $0.duration = 0.4
            return $0
        } (CABasicAnimation(keyPath: "path")), forKey: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in self?.removeFromSuperlayer() }
    }
    
    private func add() {
        destination = prospect
        prospect = nil
        path = {
            $0.move(to: CGPoint(x: origin.frame.midX, y: origin.frame.midY))
            $0.addLine(to: CGPoint(x: destination!.frame.midX, y: destination!.frame.midY))
            return $0
        } (CGMutablePath())
    }
}
