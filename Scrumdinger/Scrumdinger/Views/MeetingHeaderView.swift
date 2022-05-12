//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Park Kangwook on 2022/05/12.
//

import SwiftUI

//MeetingHeader를 따로 작업하기 위해 파일을 새로 파서 따로 작업했다
//나중 유지보수를 위함일까? 모듈화일까?

struct MeetingHeaderView: View {
    
    let secondsElasped: Int
    let secondsRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondsElasped + secondsRemaining
    }   //전체 시간 계산한 변수
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1}
        return Double(secondsElasped)/Double(secondsRemaining)
    }   //progress 계산하기 위한 변수
    
    private var minutesRemaining: Int {
        secondsRemaining/60
    }   //분으로 표시하기 위한 변수
    var body: some View {
        VStack{
            ProgressView(value: progress)
                        //ProgressView에 0..<1 범위의 소수값이 오면 자동으로 완성
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
                //여기 ScrumProgressViewStyle : custom한거임. 스타터팩에 들어있던 거. 내장코드 ㄴㄴ
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElasped)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                        .labelStyle(.trailingIcon)  //아이콘이 뒤로 가게!
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("\(minutesRemaining) minutes")
            .padding([.top, .horizontal])
        }
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElasped: 60, secondsRemaining: 100, theme: .bubblegum)
            .previewLayout(.sizeThatFits)
            //우리가 작업안 영역만 보이기
            //meeting header를 작업했다
    }
}
