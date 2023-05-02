//
//  PreviewCellVC.swift
//  AppStore
//
//  Created by Enes Sancar on 1.05.2023.
//

import UIKit

class PreviewCellVC: UICollectionViewController {
    
    //MARK: - Properties
    var resultsImage: [String] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK: - Lifecycle
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Helpers
extension PreviewCellVC {
    private func style() {
        collectionView.register(PreviewDetailCell.self, forCellWithReuseIdentifier: PreviewDetailCell.identifier)
    }
}

//MARK: - UICollectionViewDataSource
extension PreviewCellVC {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        resultsImage.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewDetailCell.identifier, for: indexPath) as? PreviewDetailCell else {
            fatalError()
        }
        cell.resultImageString = resultsImage[indexPath.row]
        return cell
    }
}
 
//MARK: - Preview Cell UICollectionViewDelegateFlowLayout
extension PreviewCellVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width / 1.6, height: view.frame.height - 10)
    }
}
