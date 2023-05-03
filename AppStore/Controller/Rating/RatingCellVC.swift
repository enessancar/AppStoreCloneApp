//
//  RatingCellVC.swift
//  AppStore
//
//  Created by Enes Sancar on 3.05.2023.
//

import UIKit

class RatingsCellVC: UICollectionViewController {
    
    //MARK: - Properties
    
    
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
extension RatingsCellVC {
    private func style() {
        collectionView.register(RatingDetailCell.self, forCellWithReuseIdentifier: RatingDetailCell.identifier)
    }
}

//MARK: - UICollectionViewDataSource
extension RatingsCellVC {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RatingDetailCell.identifier, for: indexPath) as? RatingDetailCell else {
            fatalError()
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension RatingsCellVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: view.frame.height - 10)
    }
}
