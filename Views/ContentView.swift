//
//  ContentView.swift
//  Anthroposophy
//
//  Created by Quinlan George Wingfield on 01/01/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Explore") {
                    NavigationLink {
                        CalendarView()
                    } label: {
                        Label("Soul Calendar", systemImage: "sun.max.fill")
                    }
                    NavigationLink {
                        MeditationView()
                    } label: {
                        Label("Meditations", systemImage: "sparkles")
                    }
                    NavigationLink {
                        ReadingView()
                    } label: {
                        Label("Reading", systemImage: "book.fill")
                    }
                    }
                }
            }
            .navigationTitle("Anthroposophy")
#if os(macOS)
            .listStyle(.inset)
#else
            .listStyle(.insetGrouped)
#endif
        }
    }

#Preview {
    ContentView()
}
