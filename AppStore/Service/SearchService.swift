//
//  SearchService.swift
//  AppStore
//
//  Created by Enes Sancar on 27.04.2023.
//

import Foundation
import Alamofire

struct SearchService {
    
    static func fetchData(searchText term: String,
                          completion: @escaping([Results]) -> Void) {
        
        let baseURL = "https://itunes.apple.com/search"
        let parameters = ["entity": "software", "term": term]
        
        AF.request(baseURL,method: .get, parameters: parameters).responseData { responseData in
            if let error = responseData.error {
                print(error.localizedDescription)
            }
            guard let data = responseData.data else {
                return
            }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func fetchDataID(id: String, completion: @escaping([Results]) -> Void) {
        
        let baseURL = "https://itunes.apple.com/lookup"
        let parameters = ["id": id]
        
        AF.request(baseURL,method: .get, parameters: parameters).responseData { responseData in
            if let error = responseData.error {
                print(error.localizedDescription)
            }
            guard let data = responseData.data else {
                return
            }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
