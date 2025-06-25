//
//  TeamClubInfoView.swift
//  ScoreTracker
//
//  Created by Sahil ChowKekar on 6/24/25.
//

import SwiftUI
import XCAFootballDataClient

struct TeamClubInfoView: View {
    let club: TeamStandingTable

    var body: some View {
        HStack {
            Text(club.positionText)
                .fontWeight(.bold)
                .frame(minWidth: 20)

            if let crest = club.team.crest, crest.hasSuffix("svg"),
               let url = URL(string: crest) {
                SVGWebImageView(url: url)
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
            } else {
                AsyncImage(url: URL(string: club.team.crest ?? "")) { phase in
                    switch phase {
                    case .success(let image): image.resizable()
                    default: Circle().foregroundStyle(Color.gray.opacity(0.5))
                    }
                }
                .frame(width: 40, height: 40)
            }

            Text(club.team.name)
        }
    }
}

