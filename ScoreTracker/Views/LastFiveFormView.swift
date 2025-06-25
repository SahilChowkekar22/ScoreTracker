//
//  LastFiveFormView.swift
//  ScoreTracker
//
//  Created by Sahil ChowKekar on 6/24/25.
//

import SwiftUICore

struct LastFiveFormView: View {
    let formArray: [String]?

    var body: some View {
        HStack(spacing: 4) {
            if let formArray, !formArray.isEmpty {
                ForEach(formArray, id: \.self) { form in
                    switch form {
                    case "W":
                        Image(systemName: "checkmark.circle.fill")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, .green)
                    case "L":
                        Image(systemName: "xmark.circle.fill")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, .red)
                    default:
                        Image(systemName: "minus.circle.fill")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, .gray.opacity(0.5))
                    }
                }
            } else {
                Text("-").frame(width: 120, alignment: .center)
            }
        }
    }
}

