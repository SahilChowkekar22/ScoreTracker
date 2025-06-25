//
//  StandingsTabItemView.swift
//  ScoreTracker
//
//  Created by Sahil ChowKekar on 6/24/25.
//

import SwiftUI
import XCAFootballDataClient

struct StandingsTabItemView: View {
    
    @State private var selectedCompetition: Competition?
    
    var body: some View {
        NavigationSplitView {
            List(Competition.defaultCompetitions, id: \.self, selection: $selectedCompetition) { competition in
                HStack {
                    Image(systemName: "sportscourt")
                        .foregroundStyle(.blue)
                    Text(competition.name)
                        .font(.headline)
                }
                .padding(.vertical, 8)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Standings")
        } detail: {
            Group {
                if let selectedCompetition {
                    StandingsTableView(competition: selectedCompetition)
                        .id(selectedCompetition)
                        .transition(.opacity)
                        .animation(.easeInOut, value: selectedCompetition)
                } else {
                    VStack(spacing: 16) {
                        Image(systemName: "sportscourt.fill")
                            .font(.system(size: 48))
                            .foregroundColor(.gray)
                        Text("Select a competition to view standings")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }
}

#Preview {
    StandingsTabItemView()
}
