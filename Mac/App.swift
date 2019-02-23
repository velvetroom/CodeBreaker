import AppKit
import Breaker

@NSApplicationMain class App: NSWindow, NSApplicationDelegate {
    static private(set) weak var shared: App!
    private(set) weak var terminal: Terminal?
    
    func applicationShouldTerminateAfterLastWindowClosed(_: NSApplication) -> Bool { return true }
    override func cancelOperation(_: Any?) { makeFirstResponder(nil) }
    override func mouseDown(with: NSEvent) { makeFirstResponder(nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UserDefaults.standard.set(false, forKey:"NSFullScreenMenuItemEverywhere")
        backgroundColor = .black
        NSApp.delegate = self
        App.shared = self
        
        outlets()
    }
    
    private func outlets() {
        let terminal = Terminal(Breaker.shared.mission)
        let gradientLeft = Gradient([NSColor.black.cgColor, NSColor(white:0, alpha:0).cgColor])
        let gradientRight = Gradient([NSColor(white:0, alpha:0).cgColor, NSColor.black.cgColor])
        self.terminal = terminal
        
        contentView!.addSubview(terminal)
        contentView!.addSubview(gradientLeft)
        contentView!.addSubview(gradientRight)
        
        terminal.centerXAnchor.constraint(equalTo: contentView!.centerXAnchor).isActive = true
        terminal.centerYAnchor.constraint(equalTo: contentView!.centerYAnchor).isActive = true
        
        gradientLeft.topAnchor.constraint(equalTo: contentView!.topAnchor).isActive = true
        gradientLeft.bottomAnchor.constraint(equalTo: contentView!.bottomAnchor).isActive = true
        gradientLeft.leftAnchor.constraint(equalTo: contentView!.leftAnchor).isActive = true
        
        gradientRight.topAnchor.constraint(equalTo: contentView!.topAnchor).isActive = true
        gradientRight.bottomAnchor.constraint(equalTo: contentView!.bottomAnchor).isActive = true
        gradientRight.rightAnchor.constraint(equalTo: contentView!.rightAnchor).isActive = true
    }
}
