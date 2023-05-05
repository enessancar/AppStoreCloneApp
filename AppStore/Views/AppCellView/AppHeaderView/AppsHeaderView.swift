//
//  AppsHeaderView.swift
//  AppStore
//
//  Created by Enes Sancar on 28.04.2023.
//

import UIKit
import SnapKit

class AppsHeaderView: UICollectionReusableView {
    static let identifier = "AppsHeaderView"
    
    //MARK: - Properties
    private let appsHeaderVC = AppsHeaderVC()
    
    var appsHeaderResult: [AppHeaderModel] = [] {
        didSet {
            appsHeaderVC.appsHeaderResult = appsHeaderResult
        }
    }
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Helpers
extension AppsHeaderView {
        
    private func layout() {
        addSubview(appsHeaderVC.view)
        
        appsHeaderVC.view.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
