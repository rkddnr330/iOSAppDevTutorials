//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Park Kangwook on 2022/05/07.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
