//
//  FocusDockView.swift
//  focusdock
//
//  Created by Michelle Zhang on 2025-06-18.
//

import SwiftUI

struct FocusDockView: View {
    @State private var isAddingNewMode = false
    @State private var focusModes: [FocusMode] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("🧠 FocusDock")
                .font(.headline)
            
            if isAddingNewMode {
                AddFocusFlowView(
                    onComplete: { newMode in
                        focusModes.append(newMode)
                        isAddingNewMode = false
                    },
                    onCancel: {
                        isAddingNewMode = false
                    }
                )
            } else {
                if focusModes.isEmpty {
                    Text("No focus modes yet.")
                        .foregroundColor(.gray)
                } else {
                    ForEach(focusModes) { mode in
                        Text(mode.name)
                    }
                }
                
                Divider()
                
                Button("➕ Add Focus Mode") {
                    isAddingNewMode = true
                }
            }
        }
        .padding()
        .frame(width: 300, height: 300)
    }
}
