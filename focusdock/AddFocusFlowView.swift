//
//  AddFocusFlowView.swift
//  focusdock
//
//  Created by Michelle Zhang on 2025-06-18.
//

import SwiftUI

struct AddFocusFlowView: View {
    enum Stage {
        case name, selectApps, confirm
    }

    @State private var stage: Stage = .name
    @State private var name: String = ""
    @State private var selectedApps: Set<String> = []

    let availableApps = ["Notion", "Slack", "Zoom", "Music", "Calendar"]
    let onComplete: (FocusMode) -> Void
    let onCancel: () -> Void

    var body: some View {
        VStack {
            switch stage {
            case .name:
                Text("Name Your Focus Mode")
                    .font(.headline)
                TextField("e.g., Writing Mode", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.vertical)
                Button("Next") {
                    stage = .selectApps
                }
                .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)

            case .selectApps:
                Text("Select Apps to Open")
                    .font(.headline)
                List(availableApps, id: \.self, selection: $selectedApps) { app in
                    Text(app)
                }
                .frame(height: 150)
                Button("Next") {
                    stage = .confirm
                }
                .padding(.top)

            case .confirm:
                Text("Confirm Focus Mode")
                    .font(.headline)
                Text("Name: \(name)")
                Text("Apps: \(selectedApps.joined(separator: ", "))")
                    .padding(.bottom)
                Button("Save") {
                    let newMode = FocusMode(name: name, apps: Array(selectedApps))
                    onComplete(newMode)
                }
                Button("Back") {
                    stage = .selectApps
                }
                .padding(.top, 4)
            }

            Spacer()
            Button("Cancel") {
                onCancel()
            }
            .padding(.top, 10)
        }
    }
}
