//
//  SearchResult.swift
//  AppStore
//
//  Created by Enes Sancar on 27.04.2023.
//

import Foundation

struct SearchResult: Decodable {
    
    let resultCount: Int
    let results: [Results]
}

struct Results: Decodable {
    let primaryGenreName: String
    let artworkUrl100: String
    let trackName: String
    let screenshotUrls: [String]
    var averageUserRating: Float?
    let formattedPrice: String
    let description: String
    let releaseNotes: String?
    let trackId: Int
}
