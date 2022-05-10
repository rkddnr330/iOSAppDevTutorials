//
//  EditView.swift
//  Scrumdinger
//
//  Created by Park Kangwook on 2022/05/10.
//

import SwiftUI

//변경된 값은 Data property에 저장
//이때 @State wrapper 사용. 왜냐하면, 변경된 값 인식해서 View를 바로 그릴 것.
struct DetailEditView: View {
    
    @Binding var data = DailyScrum.Data
    @State private var newAttendeeName: String = ""
    
    var body: some View {
        Form {
            Section(header:Text("meeting info")){
                TextField("Title", text: $data.title)
                HStack{
                    Slider(value: $data.lengthInMinutes, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) Minutes")
                }
                ThemePicker(selection: $data.theme)
            }
            Section(header: Text("Attendees")){
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                //Delete하는 코드
                .onDelete{ indicies in
                    data.attendees.remove(atOffsets: indicies)
                }
                HStack{
                    TextField("New Attendee", text:$newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let newAttendee = DailyScrum.Attendee(name: newAttendeeName)
                            data.attendees.append(newAttendee)
                            newAttendeeName = ""    //넣어주고 나면 값을 초기화시켜줘서 나중에도 쓸 수 있게 한다
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newAttendeeName.isEmpty)  //빈값이면 버튼 비활성화
                }
            }
        }
        
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(DailyScrum.sampleData[0].data))
    }
}
