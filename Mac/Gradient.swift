import AppKit

class Gradient: NSView {
    init(_ colors: [CGColor]) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        layer = CAGradientLayer()
        (layer as! CAGradientLayer).startPoint = CGPoint(x: 0, y: 0)
        (layer as! CAGradientLayer).endPoint = CGPoint(x: 1, y: 0)
        (layer as! CAGradientLayer).locations = [0, 1]
        (layer as! CAGradientLayer).colors = colors
        wantsLayer = true
        
        widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder: NSCoder) { return nil }
}
