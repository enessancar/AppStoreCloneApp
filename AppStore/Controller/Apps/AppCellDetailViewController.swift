//
//  AppCellDetailViewController.swift
//  AppStore
//
//  Created by Enes Sancar on 28.04.2023.
//

import UIKit

class AppCellDetailViewController: UICollectionViewController {
    
    //MARK: - Lifecycle
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        super.init(collectionViewLayout: flowLayout)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Helpers
extension AppCellDetailViewController {
    private func style() {
        
    }
    
    private func layout() {
        
    }
}

//MARK: - UICollectionViewDataSource
extension AppCellDetailViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

extension AppCellDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 30, height: view.frame.height / 3)
    }
}
