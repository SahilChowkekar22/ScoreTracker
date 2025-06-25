//
//  PlayerCrestAndNameView.swift
//  ScoreTracker
//
//  Created by Sahil ChowKekar on 6/24/25.
//

import SwiftUI
import XCAFootballDataClient

struct PlayerCrestAndNameView: View {
    let scorer: Scorer

    var body: some View {
        HStack {
            Text(scorer.posText)
                .fontWeight(.bold)
                .frame(minWidth: 20)

            if let crest = scorer.team.crest, crest.hasSuffix("svg") {
                SVGWebImageView(url: URL(string: crest)!)
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
            } else {
                AsyncImage(url: URL(string: scorer.team.crest ?? "")) { phase in
                    switch phase {
                    case .success(let image): image.resizable()
                    default: Circle().foregroundStyle(Color.gray.opacity(0.5))
                    }
                }
                .frame(width: 40, height: 40)
            }

            Text(scorer.player.name)
        }
    }
}

