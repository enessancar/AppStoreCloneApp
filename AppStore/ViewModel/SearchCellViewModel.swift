//
//  SearchCellViewModel.swift
//  AppStore
//
//  Created by Enes Sancar on 27.04.2023.
//

import Foundation
import Kingfisher

struct SearchCellViewModel {
    let result: Results
    
    init(result: Results) {
        self.result = result
    }
    
    var ratingLabel: String? {
        return String(format: "%.2f", result.averageUserRating ?? 0)
    }
    
    var nameLabel: String? {
        return result.trackName
    }
    
    var categoryLabel: String? {
        return result.primaryGenreName
    }
    
    var appImage: URL? {
        return URL(string: result.artworkUrl100)
    }
    
    var screenshot1: URL? {
        return URL(string: result.screenshotUrls[0])
    }
    
    var screenshot2: URL? {
        if result.screenshotUrls.count > 1 {
            return URL(string: result.screenshotUrls[1])
        } else {
            return URL(string: result.screenshotUrls[0])
        }
    }
    
    var screenshot3: URL? {
        if result.screenshotUrls.count > 2 {
            return URL(string: result.screenshotUrls[2])
        } else {
            return URL(string: result.screenshotUrls[0])
        }
    }
}
