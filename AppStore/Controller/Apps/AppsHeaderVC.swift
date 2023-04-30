//
//  AppsHeaderViewController.swift
//  AppStore
//
//  Created by Enes Sancar on 28.04.2023.
//

import UIKit

class AppsHeaderVC: UICollectionViewController {
    
    //MARK: - Properties
    var appsHeaderResult: [AppHeaderModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK: - Lifecycle
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        super.init(collectionViewLayout: flowLayout)
        
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Helpers
extension AppsHeaderVC {
    private func style() {
        collectionView.register(AppsHeaderViewCell.self, forCellWithReuseIdentifier: AppsHeaderViewCell.identifier)
    }
    
}

//MARK: - UICollectionViewDataSource
extension AppsHeaderVC {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        appsHeaderResult.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsHeaderViewCell.identifier, for: indexPath) as? AppsHeaderViewCell else {
            fatalError()
        }
        cell.appHeaderModel = appsHeaderResult[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 12, right: 0)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension AppsHeaderVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
}
