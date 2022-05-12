//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Park Kangwook on 2022/05/07.
//

import SwiftUI

struct MeetingView: View {
    
    @Binding var scrum: DailyScrum
    ///스타터 팩에 있던 ScrumTimer
    ///@StateObject 의미 : 여기(MeetingView)에서 SOT를 가지겠다.
    @StateObject var scrumTimer = ScrumTimer()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElasped: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Seconds Elapsed")
                            .font(.caption)
                        Label("300", systemImage: "hourglass.bottomhalf.fill")
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Seconds Remaining")
                            .font(.caption)
                        Label("600", systemImage: "hourglass.tophalf.fill")
                    }
                }
                Circle()
                    .strokeBorder(lineWidth: 24)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
            
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        ///onAppear, onDisappear 
        ///onAppear를 통해 ScrumTImer에 있는 reset 함수 불러오기
        .onAppear{
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            ///reset 이후, 새로운 scrum timer를 시작하기 위해 startScrum 함수 불러오기
            ///시간 가는 거 다루는 timer라는 내장 함수?가 있는듯. ScrumTimer보니까 그런 코드를 썼음
            scrumTimer.startScrum()
        }
        ///onDisappear를 통해 stopScrum 함수 불러오기
        .onDisappear{
            scrumTimer.stopScrum()
            ///회의 끝날 때 histoty에 저장하기 위한 코드
            let newHistory = History(attendees: scrum.attendees, lengthInMinutes: scrum.timer.secondsElapsed/60)
            scrum.history.insert(newHistory, at: 0)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
