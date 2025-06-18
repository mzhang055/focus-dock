//
//  FocusMode.swift
//  focusdock
//
//  Created by Michelle Zhang on 2025-06-18.
//

import Foundation

struct FocusMode: Identifiable {
    let id = UUID()
    let name: String
    let apps: [String]
}
