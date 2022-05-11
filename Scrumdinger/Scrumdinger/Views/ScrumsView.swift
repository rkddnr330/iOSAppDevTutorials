//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Park Kangwook on 2022/05/09.
//

import SwiftUI

struct ScrumsView: View {
    
    @Binding var scrums: [DailyScrum]
    
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
            Button(action: {}){
                Image(systemName: "plus")
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
