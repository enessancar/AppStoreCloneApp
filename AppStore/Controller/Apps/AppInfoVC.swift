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
    
    var appID: String? {
        didSet {
            guard let id = self.appID else { return }
            fetchData(id: id)
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
    }
}

//MARK: - Service
extension AppInfoVC {
    private func fetchData(id: String) {
        SearchService.fetchDataID(id: id) { results in
            self.results = results
        }
    }
}

//MARK: - Helpers
extension AppInfoVC {
    private func style() {
        self.navigationItem.largeTitleDisplayMode = .never
        
        collectionView.register(AppInfoHeaderCell.self, forCellWithReuseIdentifier: AppInfoHeaderCell.identifier)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: PreviewCell.identifier)
    }
}

//MARK: - UICollectionViewDataSource
extension AppInfoVC {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppInfoHeaderCell.identifier, for: indexPath) as? AppInfoHeaderCell else {
                fatalError()
            }
            cell.results = results.first
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewCell.identifier, for: indexPath) as? PreviewCell else {
                fatalError()
            }
            return cell
        }
        return UICollectionViewCell()
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
            return .init(width: view.frame.width, height: estimatedCell.height)
        } else {
            return .init(width: view.frame.width, height: 400)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 10)
    }
}