//
//  RatingDetailCellViewModel.swift
//  AppStore
//
//  Created by Enes Sancar on 3.05.2023.
//

import Foundation

struct RatingDetailCellViewModel {
    let results: Entry
    
    init(results: Entry) {
        self.results = results
    }
    
    var authorName: String? {
        return results.author.name.label
    }
    
    var title: String? {
        return results.title.label
    }
    
    var ratings: String? {
        var resultText = ""
        var count = results.rating.label.count
        for _ in 0...count {
            resultText.append("⭐️")
        }
        return resultText
    }
    
    var content: String? {
        return results.content.label
    }
}
