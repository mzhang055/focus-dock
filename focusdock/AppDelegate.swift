//
//  AppDelegate.swift
//  focusdock
//
//  Created by Michelle Zhang on 2025-06-18.
//
import Cocoa
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem!
    let popover = NSPopover()

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create menu bar item
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        if let button = statusBarItem.button {
            button.image = NSImage(systemSymbolName: "leaf.fill", accessibilityDescription: "FocusDock Icon")
            button.image?.isTemplate = true
            button.action = #selector(togglePopover(_:))
            button.target = self
        }

        // Set the popover content to a SwiftUI view
        let popoverView = FocusDockView()
        let hostingController = NSHostingController(rootView: popoverView)
        popover.contentViewController = hostingController
        popover.behavior = .transient
    }

    @objc func togglePopover(_ sender: Any?) {
        guard let button = statusBarItem.button else { return }

        if popover.isShown {
            popover.performClose(sender)
        } else {
            print("Showing popover")
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            popover.contentViewController?.view.window?.makeKey()
        }
    }
}
