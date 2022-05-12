//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Park Kangwook on 2022/05/09.
//

import SwiftUI

struct ScrumsView: View {
    
    @Binding var scrums: [DailyScrum]
    ///sheet 쓸거임
    @State private var isPresentingNewScrumView = false
    ///DailyScrum.Data()의 default value 있음 ('빈값'이 들어있다)
    @State private var newScrumData = DailyScrum.Data()
    
    /*
     CRUD - Create
     하는 것은 어렵지 않다. Update를 활용하면 된다. 워낙 이전 코드들이 모듈화가 잘 되어 있기 때문에.
     Update하는 View를 가져오고, 그 곳에 빈 값만 넣어서 사용자가 빈 값에다가 원하는 정보를 추가하여 만들면 된다
     그러고 ScrumsView에는 자동으로 append된 값이 정렬된다. 왜냐하면 로직 자체가 담긴 Data를 불러오는 것이기 때문
     */
    
    var body: some View {
        
        List{
            ForEach($scrums){ $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                                            //내가 직접 destination view를 작성하기 전까지 이렇게만 해놔도 새로운 view로 이동하는 것처럼 구현되어있음!
                    CardView(scrum:scrum)
                      .listRowBackground(scrum.theme.mainColor)
                }
            }
        }
        .navigationTitle("Daily Scrum")
        .toolbar(){
            Button(action: {
                isPresentingNewScrumView = true
            }){
                Image(systemName: "plus")
            }
        }
        ///sheet 위치 확인!
        .sheet(isPresented: $isPresentingNewScrumView){
            NavigationView{
                DetailEditView(data: $newScrumData)
                    ///toolbar 위치 확인!
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction){
                            Button("Dismiss"){
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction){
                            Button("Create"){
                                let newScrum = DailyScrum(data: newScrumData)
                                scrums.append(newScrum)
                                isPresentingNewScrumView = false
                                
                                newScrumData = DailyScrum.Data()
                            }
                        }
                    }
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView{
            ScrumsView(scrums: .constant(DailyScrum.sampleData))
        }
    }
}
