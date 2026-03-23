//
//  ReadingView.swift
//  Anthroposophy
//
//  Created by Quinlan George Wingfield on 01/01/2026.
//

import SwiftUI

struct ReadingView: View {
    var body: some View {
        NavigationStack {
            List(lectures) { lecture in
                NavigationLink(lecture.title) {
                    LectureDetailView(lecture: lecture)
                }
            }
        }
        .navigationTitle("Reading")
    }
}
