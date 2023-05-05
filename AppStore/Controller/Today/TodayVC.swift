//
//  TodayViewController.swift
//  AppStore
//
//  Created by Enes Sancar on 28.04.2023.
//

import UIKit

class TodayVC: UICollectionViewController {
    
    //MARK: - Properties
    private let todayModelResults: [Today] = modelData
    private var startLocation: CGRect?
    private let todayDetailVC = TodayDetailVC()
    
    //MARK: - Lifecycle
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
}

//MARK: - Helpers
extension TodayVC {
    private func style() {
        collectionView.backgroundColor = .systemGroupedBackground
        
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayCell.identifier)
    }
}

//MARK: - UICollectionViewDataSource
extension TodayVC {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        todayModelResults.count 
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCell.identifier, for: indexPath) as? TodayCell else {
            fatalError()
        }
        cell.today = self.todayModelResults[indexPath.row]
        return cell
    }
}

//MARK: - Action
extension TodayVC {
    @objc private func handleTodayDetailVC(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8) {
            self.todayDetailVC.view.frame = self.startLocation ?? .zero
            self.tabBarController?.tabBar.alpha = 1
        } completion: { _ in
            self.todayDetailVC.removeFromParent()
            self.todayDetailVC.view.removeFromSuperview()
        }
    }
}

//MARK: - UICollectionViewDelegate
extension TodayVC {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = collectionView.cellForItem(at: indexPath)
        self.startLocation = item?.superview?.convert(item?.frame ?? .zero, to: nil)
        todayDetailVC.view.frame = startLocation ?? .zero
        todayDetailVC.today = todayModelResults[indexPath.row]
        
        todayDetailVC.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTodayDetailVC)))
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8) {
            self.todayDetailVC.view.frame = self.view.frame
            self.tabBarController?.tabBar.alpha = 0
        }
        addChild(todayDetailVC)
        view.addSubview(todayDetailVC.view)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension TodayVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width / 1.3, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 30 )
    }
}
