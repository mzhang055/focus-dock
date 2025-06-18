//
//  PopoverView.swift
//  focusdock
//
//  Created by Michelle Zhang on 2025-06-18.
//
import SwiftUI

struct PopoverView: View {
    var body: some View {
        VStack {
            Text("🧠 AppFocus")
                .font(.title)
            Text("Choose a mode:")
            Button("Writing Mode") {
                print("Opening Notion...")
            }
        }
        .padding()
        .frame(width: 220, height: 120)
    }
}
