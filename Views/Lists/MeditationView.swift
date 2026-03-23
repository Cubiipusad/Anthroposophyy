//
//  MeditationView.swift
//  Anthroposophy
//
//  Created by Quinlan George Wingfield on 01/01/2026.
//
//  INCLUDING the six basic exercises
//

import SwiftUI

struct MeditationView: View {
    private let exercises = [
        "Control of Thought",
        "Control of Will",
        "Equanimity",
        "Positivity",
        "Open-mindedness",
        "Harmony"
    ]

    var body: some View {
        List {
            Section {
                ForEach(exercises, id: \.self) { item in
                    Label(item, systemImage: "leaf.fill")
                }
            } header: {
                Text("Six Basic Exercises")
            } footer: {
                Text("Tap an item to learn more in a future update.")
            }
        }
        .navigationTitle("Meditations")
    }
}

