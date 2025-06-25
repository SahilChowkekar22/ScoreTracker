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

let apiKey = "API_Key"

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
