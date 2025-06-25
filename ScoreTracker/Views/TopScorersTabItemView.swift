//
//  TopScorersTabItemView.swift
//  ScoreTracker
//
//  Created by Sahil ChowKekar on 6/24/25.
//

import SwiftUI
import XCAFootballDataClient

struct TopScorersTabItemView: View {
    @State private var selectedCompetition: Competition?
    
    var body: some View {
        NavigationSplitView {
            List(Competition.defaultCompetitions, id: \.self, selection: $selectedCompetition) { competition in
                HStack {
                    Image(systemName: "figure.soccer")
                        .foregroundStyle(.green)
                    Text(competition.name)
                        .font(.headline)
                }
                .padding(.vertical, 8)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Top Scorers")
        } detail: {
            Group {
                if let selectedCompetition {
                    TopScorersTableView(competition: selectedCompetition)
                        .id(selectedCompetition)
                        .transition(.opacity)
                        .animation(.easeInOut, value: selectedCompetition)
                } else {
                    VStack(spacing: 16) {
                        Image(systemName: "figure.soccer")
                            .font(.system(size: 48))
                            .foregroundColor(.gray)
                        Text("Select a competition to view top scorers")
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
    TopScorersTabItemView()
}
