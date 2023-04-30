//
//  AppCellDetailCellViewModel.swift
//  AppStore
//
//  Created by Enes Sancar on 30.04.2023.
//

import Foundation

struct AppCellDetailCellViewModel {
    let result: FeedResult
    
    init(result: FeedResult) {
        self.result = result
    }
    
    var nameLabel: String? {
        return result.name
    }
    
    var artistName: String? {
        return result.artistName
    }
    
    var appImage: URL? {
        return URL(string: result.artworkUrl100)
    }
}
 
