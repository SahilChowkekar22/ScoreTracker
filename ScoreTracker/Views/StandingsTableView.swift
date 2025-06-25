//
//  StandingsTableView.swift
//  ScoreTracker
//
//  Created by Sahil ChowKekar on 6/24/25.
//

import SwiftUI
import XCAFootballDataClient

struct StandingsTableView: View {
    let competition: Competition
    @Bindable var vm = StandingsTableObservable()
    
    var tableContent: some View {
        VStack {
            if let standings = vm.standings, !standings.isEmpty {
                Table(of: TeamStandingTable.self) {
                    TableColumn("Club") { club in
                        TeamClubInfoView(club: club)
                    }.width(min: 264)

                    TableColumn("W") { Text($0.wonText).frame(minWidth: 40) }.width(40)
                    TableColumn("D") { Text($0.drawText).frame(minWidth: 40) }.width(40)
                    TableColumn("L") { Text($0.lostText).frame(minWidth: 40) }.width(40)
                    TableColumn("GF") { Text($0.goalsForText).frame(minWidth: 40) }.width(40)
                    TableColumn("GA") { Text($0.goalsAgainstText).frame(minWidth: 40) }.width(40)
                    TableColumn("GD") { Text($0.goalDifferenceText).frame(minWidth: 40) }.width(40)
                    TableColumn("Pts") { Text($0.pointsText).frame(minWidth: 40) }.width(40)

                    TableColumn("Last 5") { club in
                        LastFiveFormView(formArray: club.formArray)
                    }.width(120)

                } rows: {
                    ForEach(standings) { TableRow($0) }
                }
                .foregroundStyle(.primary)
            } else {
                contentStateView
            }
        }
    }

    var body: some View {
        tableContent
            .navigationTitle(competition.name + " Standings")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Picker("Filter Options", selection: $vm.selectedFilter) {
                        ForEach(vm.filterOptions, id: \.self) { season in
                            Text(season.text)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }

            .task(id: vm.selectedFilter.id) {
                await vm.fetchStandings(competition: competition)
            }
    }

    @ViewBuilder
    var contentStateView: some View {
        switch vm.fetchPhase {
        case .fetching:
            VStack(spacing: 12) {
                ProgressView()
                Text("Loading standings...")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .success:
            VStack(spacing: 12) {
                Image(systemName: "sportscourt")
                    .font(.system(size: 48))
                    .foregroundColor(.gray)
                Text("No standings available for this season.")
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
        StandingsTableView(competition: .defaultCompetitions[1])
    }
}
