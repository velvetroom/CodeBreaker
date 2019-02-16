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
        
        documentView!.layer!.addSublayer({
            $0.path = {
                $0.addArc(center: CGPoint(x: 400, y: 300), radius: 10, startAngle: 0, endAngle: .pi * 2, clockwise: true)
                return $0
            } (CGMutablePath())
            $0.lineWidth = 4
            $0.strokeColor = NSColor.white.cgColor
            return $0
        } (CAShapeLayer()))
    }
    
    required init?(coder: NSCoder) { return nil }
}
