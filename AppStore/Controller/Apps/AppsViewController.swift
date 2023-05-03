//
//  AppsViewController.swift
//  AppStore
//
//  Created by Enes Sancar on 28.04.2023.
//

import UIKit

class AppsViewController: UICollectionViewController {
    
    //MARK: - Properties
    var feedArray: [Feed] = []
    var appsHeaderResult: [AppHeaderModel] = []
    
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
        fetchDetailData()
    }
}

//MARK: - Helpers
extension AppsViewController {
    private func style() {
        collectionView.register(AppCell.self, forCellWithReuseIdentifier: AppCell.identifier)
        
        collectionView.register(AppsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsHeaderView.identifier)
    }
    
    private func layout() {
    }
}

//MARK: - Service
extension AppsViewController {
    
    private func fetchDetailData() {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        
        AppsService.fetchData(urlString: URL_TOPFREE) { feed in
            dispatchGroup.leave()
            self.feedArray.append(feed)
        }
        dispatchGroup.enter()
        AppsService.fetchData(urlString: URL_TOPPAID) { feed in
            dispatchGroup.leave()
            self.feedArray.append(feed)
        }
        dispatchGroup.enter()
        AppsService.fetchHeaderData(urlString: URL_HEADER) { result in
            dispatchGroup.leave()
            self.appsHeaderResult = result
        }
        
        dispatchGroup.notify(queue: .main) {
            self.collectionView.reloadData()
        }
    }
}
//MARK: - UICollectionVewDataSource
extension AppsViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        feedArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppCell.identifier, for: indexPath) as? AppCell else {
            fatalError()
        }
        cell.feed = self.feedArray[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsHeaderView.identifier, for: indexPath) as? AppsHeaderView else {
            fatalError()
        }
        header.appsHeaderResult = self.appsHeaderResult
        return header
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension AppsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
}

//MARK: - App
extension AppsViewController: AppCellProtocol {
    func goAppInfoViewController(id: String) {
        let contoller = AppInfoVC(id: id)
        self.navigationController?.pushViewController(contoller, animated: true)
    }
}
