//
//  Note.swift
//  Anthroposophy
//
//  Created by Quinlan George Wingfield on 23/03/2026.
//

import SwiftData
import Foundation

@Model
class Note {
    var id = UUID()
    var lectureID: UUID   // links to your Lecture struct
    var title: String
    var content: String
    var createdAt: Date

    init(lectureID: UUID, content: String, title: String) {
        self.title = title
        self.lectureID = lectureID
        self.content = content
        self.createdAt = Date()
    }
}
