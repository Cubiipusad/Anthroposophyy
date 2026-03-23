//
//  ReaderView.swift
//  Anthroposophy
//
//  Created by Quinlan George Wingfield on 22/03/2026. This file makes it so you can read stuff in the lectures file
//

import SwiftUI
import SwiftData

struct LectureDetailView: View {
    let lecture: lecture
    
    @Environment(\.modelContext) private var context
    @Query var notes: [Note]

    @State private var showingNoteEditor = false
    @State private var newNoteText = ""
    
    var lectureNotes: [Note] {
        notes.filter { $0.lectureID == lecture.id }
    }

    // 1. Control visibility (automatic handles showing/hiding)
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            
            // SIDEBAR COLUMN
            List {
                NavigationLink(destination: Text("Notes")) {
                    Label("Notes", systemImage: "pencil.and.outline")
                }
                NavigationLink(destination: Text("All Notes")) {
                    Label("All Notes", systemImage: "note.text")
                }
                NavigationLink(destination: Text("Resources View")) {
                    Label("Resources", systemImage: "books.vertical")
                }
                NavigationLink(destination: Text("Settings View")) {
                    Label("Settings", systemImage: "gear")
                }
                Divider()
                HStack{
                    Group{
                        Button { /* Action */ } label: { Image(systemName: "bookmark") }
                        Button {
                            let newNote = Note(
                                lectureID: lecture.id,
                                content: "New note",
                                title: "Untitled"
                            )
                            context.insert(newNote)
                        } label: {
                            Image(systemName: "plus")
                        }
                        Button { /* Action */ } label: { Image(systemName: "square.and.arrow.up") }
                    }
                    .buttonStyle(.plain)
                }
                Divider()
                VStack {
                    Text("Fun Fact")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.trailing)
                    Text("As Rudolf Steiner explains, it was necessary for Jesus to retreat into the wilderness after his baptism to fully develop his super-sensible abilities.")
                        .font(.callout)
                        .lineLimit(nil)
                }
            }
            .navigationTitle("Tools")
            .listStyle(.sidebar)
            
        } detail: {
            
            // DETAILS
            ScrollView{
                VStack {
                    Image("Volcano")
                        .resizable()
                        .aspectRatio(16/9, contentMode: .fill)
                        .cornerRadius(12)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Text(lecture.title)
                        .font(.title)
                    
                    Spacer()
                        .frame(height: 6)
                    
                    HStack {
                        Text("GA " + lecture.ga)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("·")
                        
                        Text(lecture.date)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Divider()
                    Spacer().frame(height: 16)
                    }

                    Spacer().frame(height: 24)

                    Text(lecture.content)
                        .lineSpacing(6)
                }
                .padding()
            }
            }
            }


