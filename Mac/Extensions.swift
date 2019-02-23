import AppKit

extension NSFont {
    class func light(_ size: CGFloat) -> NSFont { return NSFont(name: "SFMono-Light", size: size)! }
    class func bold(_ size: CGFloat) -> NSFont { return NSFont(name: "SFMono-Bold", size: size)! }
}

extension NSColor {
    static let halo = #colorLiteral(red: 0.231372549, green: 0.7215686275, blue: 1, alpha: 1)
    static let shade = #colorLiteral(red: 0.3921568627, green: 0.431372549, blue: 0.4705882353, alpha: 1)
}
