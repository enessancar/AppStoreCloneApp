//
//  AppsHeaderView.swift
//  AppStore
//
//  Created by Enes Sancar on 28.04.2023.
//

import UIKit

class AppsHeaderView: UICollectionReusableView {
    static let identifier = "AppsHeaderView"
    
    //MARK: - Properties
    private let appsHeaderVC = AppsHeaderVC()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Helpers
extension AppsHeaderView {
    
    private func style() {
        appsHeaderVC.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubview(appsHeaderVC.view)
        
        NSLayoutConstraint.activate([
            appsHeaderVC.view.topAnchor.constraint(equalTo: topAnchor),
            appsHeaderVC.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            appsHeaderVC.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            appsHeaderVC.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
