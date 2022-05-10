//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Park Kangwook on 2022/05/09.
//

import Foundation

struct DailyScrum: Identifiable {
    let id: UUID //인스턴스 하나씩 다루기 위해
    var title: String
    var attendees: [Attendee] //String으로 이루어진 List라는 의미를 '[String]'으로 표기
    var lengthInMinutes: Int
    var theme: Theme //Theme.swift에서 선언해준 enum 타입
    
    //이거 custom initializer임
    //매개변수 이니셜라이저
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme){
        self.id = id
        self.title = title
        self.attendees = attendees.map{Attendee(name:$0)}
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
    
}

extension DailyScrum {
    
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    //이런 식으로 default값 지정해주면, 나중에 Data()라고 선언하면서 바로 쓸 수 있음
    struct Data {
        var title: String = ""
        var attendees: [Attendee] = []
        var lengthInMinutes: Double = 5
        var theme: Theme = .seafoam
    }
    
    var data: Data {
        //밑에 코드 무슨 말이지 ..
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme)
    }
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
