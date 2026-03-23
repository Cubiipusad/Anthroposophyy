//
//  CalendarView.swift
//  Anthroposophy
//
//  Created by Quinlan George Wingfield on 01/01/2026.
//

import SwiftUI

func calendarOfSoulWeek(for date: Date = .init()) -> Int {
    let cal = Calendar(identifier: .gregorian)
    
    // Known correct reference: March 22, 2026 = Week 50
    let referenceDate = cal.date(from: DateComponents(year: 2026, month: 3, day: 22))!
    let referenceWeek = 50
    
    let days = cal.dateComponents([.day], from: referenceDate, to: date).day ?? 0
    let weeksOffset = days / 7
    
    let week = ((referenceWeek - 1 + weeksOffset) % 52 + 52) % 52 + 1
    return week
}

struct CalendarView: View {
    var week: Int { calendarOfSoulWeek() }
    var verse: String { Verses.all[max(0, min(51, week - 1))] }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Calendar of the Soul")
                        .font(.largeTitle).bold()
                    Text("This week's verse (Northern Hemisphere)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text(verse)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(6)
                    Text("Week \(week)")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(.thinMaterial)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .strokeBorder(.quaternary, lineWidth: 1)
                )
            }
            .padding()
        }
        .navigationTitle("Soul Calendar")
#if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
    }
}

#Preview {
    NavigationStack { CalendarView() }
}
