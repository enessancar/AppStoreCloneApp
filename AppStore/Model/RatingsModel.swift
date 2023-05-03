//
//  RatingsModel.swift
//  AppStore
//
//  Created by Enes Sancar on 3.05.2023.
//

import Foundation

struct RatingsModel: Decodable {
    let feed: RatingFeed
}

struct RatingFeed: Decodable {
    let entry: [Entry]
}

struct Entry: Decodable {
    let author: Author
    let title, content, rating: Label
    
    private enum CodingKeys: String, CodingKey {
        case author
        case title, content
        case rating = "im:rating"
    }
}

struct Author: Decodable {
    let name: Label
}

struct Label: Decodable {
    let label: String
}
