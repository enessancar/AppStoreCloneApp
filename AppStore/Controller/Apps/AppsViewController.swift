//
//  AppsViewController.swift
//  AppStore
//
//  Created by Enes Sancar on 28.04.2023.
//

import UIKit

class AppsViewController: UICollectionViewController {
    
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
extension AppsViewController {
    private func style() {
        collectionView.register(AppCell.self, forCellWithReuseIdentifier: AppCell.identifier)
    }
    
    private func layout() {
        
    }
}

//MARK: - UICollectionVewDataSource
extension AppsViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppCell.identifier, for: indexPath) as? AppCell else {
            fatalError()
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension AppsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
}
