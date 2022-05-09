//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Park Kangwook on 2022/05/09.
//

import Foundation

struct DailyScrum: Identifiable {
    let id: UUID = UUID()
    var title: String
    var attendees: [String] //String으로 이루어진 List라는 의미를 '[String]'으로 표기
    var lengthInMinutes: Int
    var theme: Theme //Theme.swift에서 선언해준 enum 타입
    
    
}

//provide sample data
extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
    ]
}
