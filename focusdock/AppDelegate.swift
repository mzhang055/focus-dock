//
//  AppDelegate.swift
//  focusdock
//
//  Created by Michelle Zhang on 2025-06-18.
//

import Cocoa
sdfds
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem?

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create a menu bar item with variable width
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        if let button = statusBarItem?.button {
            button.title = "Open Window"
            button.action = #selector(statusBarButtonClicked(_:))
            button.target = self
        }
    }

    @objc func statusBarButtonClicked(_ sender: NSStatusBarButton) {
      print("Menu item clicked")
      // We'll implement the window handling logic here
    }
}
