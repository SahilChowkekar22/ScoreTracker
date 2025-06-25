//
//  TopScorersTableView.swift
//  ScoreTracker
//
//  Created by Sahil ChowKekar on 6/24/25.
//


import SwiftUI
import XCAFootballDataClient

struct TopScorersTableView: View {
    let competition: Competition
    @Bindable var vm = TopScorersTableObservable()
    
    var body: some View {
        VStack {
            if let scorers = vm.scorers, !scorers.isEmpty {
                Table(of: Scorer.self) {
                    TableColumn("Pos") { scorer in
                        PlayerCrestAndNameView(scorer: scorer)
                    }
                    .width(min: 264)

                    TableColumn("Matches") {
                        Text($0.playedMatchesText)
                            .frame(minWidth: 64)
                    }.width(64)
                    
                    TableColumn("Goals") {
                        Text($0.goalsText)
                            .frame(minWidth: 64)
                    }.width(64)

                    TableColumn("⌀ Goals") {
                        Text($0.goalsPerMatchRatioText)
                            .frame(minWidth: 64)
                    }.width(64)

                    TableColumn("Assists") {
                        Text($0.assistsText)
                            .frame(minWidth: 64)
                    }.width(64)

                    TableColumn("Pen.") {
                        Text($0.penaltiesText)
                            .frame(minWidth: 64)
                    }.width(64)
                } rows: {
                    ForEach(scorers) { scorer in
                        TableRow(scorer)
                    }
                }
                .foregroundStyle(.primary)
            } else {
                contentStateView
            }
        }
        .navigationTitle(competition.name + " Top Scorers")
        .toolbar {
            ToolbarItem(placement: .bottomOrnament) {
                Picker("Filter Options", selection: $vm.selectedFilter) {
                    ForEach(vm.filterOptions, id: \.self) { season in
                        Text(season.text)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.top, 4)
            }
        }
        .task(id: vm.selectedFilter.id) {
            await vm.fetchTopScorers(competition: competition)
        }
    }
    
    @ViewBuilder
    var contentStateView: some View {
        switch vm.fetchPhase {
        case .fetching:
            VStack(spacing: 12) {
                ProgressView()
                Text("Loading top scorers...")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        case .success:
            VStack(spacing: 12) {
                Image(systemName: "figure.soccer")
                    .font(.system(size: 48))
                    .foregroundColor(.gray)
                Text("No scorers available for this season.")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        case .failure(let error):
            VStack(spacing: 12) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.orange)
                Text(error.localizedDescription)
                    .font(.headline)
                    .foregroundColor(.red)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        default:
            EmptyView()
        }
    }
}


#Preview {
    NavigationStack {
        TopScorersTableView(competition: .defaultCompetitions[0])
    }
}
