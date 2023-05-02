//
//  PreviewDetailCellViewModel.swift
//  AppStore
//
//  Created by Enes Sancar on 2.05.2023.
//

import Foundation

struct PreviewDetailCellViewModel {
    let results: String
    
    init(results: String) {
        self.results = results
    }
    
    var imageUrl: URL? {
        return URL(string: results)
    }
}
