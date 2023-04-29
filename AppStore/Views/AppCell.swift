//
//  AppCell.swift
//  AppStore
//
//  Created by Enes Sancar on 28.04.2023.
//

import UIKit

class AppCell: UICollectionViewCell {
    static let identifier = "AppCell"
    
    //MARK: - Properties
    private let sectionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Section Name"
        return label
    }()
    
    private let appCellDetailVC = AppCellDetailVC()
    
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

extension AppCell {
    private func style() {
        
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        appCellDetailVC.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubview(sectionLabel)
        addSubview(appCellDetailVC.view)
        
        NSLayoutConstraint.activate([
            sectionLabel.topAnchor.constraint(equalTo: topAnchor),
            sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            sectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            appCellDetailVC.view.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor),
            appCellDetailVC.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            appCellDetailVC.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            appCellDetailVC.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
