import AppKit

@NSApplicationMain class App: NSWindow, NSApplicationDelegate {
    static private(set) weak var shared: App!
    
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
        let terminal = Terminal.shared
        
        contentView!.addSubview(terminal)
        
        terminal.topAnchor.constraint(equalTo: contentView!.topAnchor).isActive = true
        terminal.leftAnchor.constraint(equalTo: contentView!.leftAnchor).isActive = true
        terminal.rightAnchor.constraint(equalTo: contentView!.rightAnchor).isActive = true
        terminal.bottomAnchor.constraint(equalTo: contentView!.bottomAnchor).isActive = true
        
        terminal.prepare(10)
    }
}
