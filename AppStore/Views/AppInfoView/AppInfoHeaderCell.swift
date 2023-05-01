//
//  AppInfoHeaderCell.swift
//  AppStore
//
//  Created by Enes Sancar on 30.04.2023.
//

import UIKit
import Kingfisher

class AppInfoHeaderCell: UICollectionViewCell {
    static let identifier = "AppInfoHeaderCell"
    
    //MARK: - Properties
    var results: Results? {
        didSet {
            configure()
        }
    }
    private let appIconImageView = IconImageView(height: 120, width: 120, cornerRadius: 16)
    private let nameLabel = BodyLabel(fontSize: 23, weight: .bold, textColor: .label, numberOfLines: 2)
    
    
    private let whatsNewLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "What's New"
        return label
    }()
    
    private let releaseNoteLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17)
        label.text = "Description Label"
        return label
    }()
    
    private lazy var  getButton = GetButton()
    
    private var labelStackView: UIStackView!
    private var headStackView: UIStackView!
    private var newStackView: UIStackView!
    private var overalStackView: UIStackView!
    
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
extension AppInfoHeaderCell {
    private func style() {
        
        labelStackView = UIStackView(arrangedSubviews: [nameLabel, getButton])
        labelStackView.axis = .vertical
        labelStackView.alignment = .leading
        
        headStackView = UIStackView(arrangedSubviews: [appIconImageView, labelStackView])
        headStackView.axis = .horizontal
        headStackView.spacing = 8
        
        newStackView = UIStackView(arrangedSubviews: [whatsNewLabel, releaseNoteLabel])
        newStackView.axis = .vertical
        newStackView.spacing = 8
        
        overalStackView = UIStackView(arrangedSubviews: [headStackView, newStackView])
        overalStackView.axis = .vertical
        overalStackView.spacing = 16
        overalStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubview(overalStackView)
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: headStackView.topAnchor),
            
            overalStackView.topAnchor.constraint(equalTo: topAnchor),
            overalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            overalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            overalStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configure() {
        guard let results = results else {
            return
        }
        let viewModel = AppInfoHeaderCellViewModel(result: results)
        
        self.nameLabel.text = viewModel.name
        self.releaseNoteLabel.text = viewModel.releaseNote
        self.appIconImageView.kf.setImage(with: viewModel.appImageUrl)
        self.getButton.setTitle(viewModel.formattedPrice, for: .normal)
    }
}
