//
//  focusdockApp.swift
//  focusdock
//
//  Created by Michelle Zhang on 2025-06-17.
//
import SwiftUI

@main
struct focusdockApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            EmptyView()  // No visible window
        }
    }
}
