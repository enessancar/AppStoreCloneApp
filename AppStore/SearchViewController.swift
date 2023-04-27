//
//  ViewController.swift
//  AppStore
//
//  Created by Enes Sancar on 27.04.2023.
//

import UIKit

class SearchViewController: UICollectionViewController {
    
    //MARK: - Properties
    var searchResults: [Results] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK: - Lifecycle
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

//MARK: - Helpers
extension SearchViewController {
    
    private func style() {
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifier)
        
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    private func layout() {
        
    }
}

//MARK: - UICollectionViewDataSource
extension SearchViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.identifier, for: indexPath) as? SearchCell else {
            fatalError()
        }
        cell.result = self.searchResults[indexPath.row]
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.size.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 0, height: 10)
    }
}

//MARK: - SearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        SearchService.fetchData(searchText: searchText) { result in
            self.searchResults = result
        }
    }
}
