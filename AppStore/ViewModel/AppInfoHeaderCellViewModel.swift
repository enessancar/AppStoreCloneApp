//
//  AppInfoHeaderCellViewModel.swift
//  AppStore
//
//  Created by Enes Sancar on 1.05.2023.
//

import Foundation

struct AppInfoHeaderCellViewModel {
    let result: Results
    
    init(result: Results) {
        self.result = result
    }
    
    var name: String? {
        return result.trackName
    }
    
    var releaseNote: String? {
        return result.releaseNotes
    }
    
    var appImageUrl: URL? {
        return URL(string: result.artworkUrl100)
    }
    
    var formattedPrice: String? {
        return result.formattedPrice
    }
}
