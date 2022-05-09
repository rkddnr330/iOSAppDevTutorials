//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Park Kangwook on 2022/05/09.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    
    var body: some View {

        List {
            Section(header: Text("Meeting Info")){
                NavigationLink(destination: MeetingView()) {
                    Label("Starting Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) Minutes")
                }
                .accessibilityElement(children: .combine)
                
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            
            Section(header: Text("attendees")){
                ForEach(scrum.attendees) {attendee in
                    Label("\(attendee.name)", systemImage: "person")
                }
            }
        }

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(scrum: DailyScrum.sampleData[0])
        }
    }
}
