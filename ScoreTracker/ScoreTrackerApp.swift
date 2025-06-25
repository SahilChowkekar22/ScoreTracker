//
//  ScoreTrackerApp.swift
//  ScoreTracker
//
//  Created by Sahil ChowKekar on 6/24/25.
//
//
//import SwiftUI
//
//@main
//struct ScoreTrackerApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}

import SwiftUI

let apiKey = "80d04bc220424866b44eaffded9ea476"

@main
struct ScoreTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                StandingsTabItemView()
                    .tabItem { Label("Standings", systemImage: "table.fill") }
                
                TopScorersTabItemView()
                    .tabItem { Label("Top Scorers", systemImage: "soccerball.inverse") }
            }
        }
    }
}
