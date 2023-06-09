//
//  AppInfoVC.swift
//  AppStore
//
//  Created by Enes Sancar on 30.04.2023.
//

import UIKit

class AppInfoVC: UICollectionViewController {
    
    //MARK: - Properties
    var results: [Results] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var resultsEntry: [Entry] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    let appID: String
       
    //MARK: - Lifecycle
    init(id: String) {
        self.appID = id
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        fetchData(id: appID)
        fetchRatingsData(id: appID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
}

//MARK: - Service
extension AppInfoVC {
    private func fetchData(id: String) {
        SearchService.fetchDataID(id: id) { results in
            self.results = results
        }
    }
    
    private func fetchRatingsData(id: String) {
        AppsService.fetchRatingData(id: id) { resultsEntry in
            self.resultsEntry = resultsEntry
        }
    }
}

//MARK: - Helpers
extension AppInfoVC {
    private func style() {
        self.navigationItem.largeTitleDisplayMode = .never
        
        collectionView.register(AppInfoHeaderCell.self, forCellWithReuseIdentifier: AppInfoHeaderCell.identifier)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: PreviewCell.identifier)
        collectionView.register(RatingCell.self, forCellWithReuseIdentifier: RatingCell.identifier)
    }
}

//MARK: - UICollectionViewDataSource
extension AppInfoVC {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppInfoHeaderCell.identifier, for: indexPath) as? AppInfoHeaderCell else {
                fatalError()
            }
            cell.results = self.results.first
            return cell
        } else if indexPath.item == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewCell.identifier, for: indexPath) as? PreviewCell else {
                fatalError()
            }
            cell.resultsImage = results.first?.screenshotUrls ?? []     
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RatingCell.identifier, for: indexPath) as? RatingCell else {
                fatalError()
            }
            cell.resultsEntry = self.resultsEntry
            return cell
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension AppInfoVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
            let cell = AppInfoHeaderCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 250))
            cell.results = results.first
            
            cell.layoutIfNeeded()
            let estimatedCell = cell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            return .init(width: view.frame.width - 10, height: estimatedCell.height)
        }
        else if indexPath.item == 1 {
            return .init(width: view.frame.width, height: 500)
        }
        else {
            return .init(width: view.frame.width, height: 250)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 10)
    }
}
