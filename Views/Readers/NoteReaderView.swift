//
//  NoteReaderView.swift
//  Anthroposophy
//
//  Created by Quinlan George Wingfield on 23/03/2026.
//

import SwiftUI

struct NoteReaderView: View {
    @State var note: Note
    
    var body: some View {
        VStack {
            TextEditor(text: $note.title)
                .font(.title)
            Divider()
            TextEditor(text: $note.content)
                .frame(minHeight: 200)
            Spacer()
        }
        .padding()
        .navigationTitle(Text(note.title))
    }
}
