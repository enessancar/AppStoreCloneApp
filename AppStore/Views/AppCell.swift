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
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Section Name"
        return label
    }()
    
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
        backgroundColor = .green
        
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubview(sectionLabel)
        
        NSLayoutConstraint.activate([
            sectionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            sectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
