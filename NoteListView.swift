//
//  NoteListView.swift
//  Anthroposophy
//
//  Created by Quinlan George Wingfield on 23/03/2026.
//

import SwiftUI
import SwiftData

struct NoteListView: View {
    @Environment(\.modelContext) private var context
    @Query var notes: [Note]

    var body: some View {
        NavigationStack {
            List(notes) { note in
                NavigationLink(destination: NoteReaderView(note: note)) {
                    Text(note.title)
                }
            }
            .navigationTitle("Notes")
            .toolbar {
            }
        }
        
    }
}
