//
//  AppHeaderModel.swift
//  AppStore
//
//  Created by Enes Sancar on 30.04.2023.
//

import Foundation

struct AppHeaderModel: Decodable {
    let id: String
    let name: String
    let imageUrl: String
    let title: String
}
