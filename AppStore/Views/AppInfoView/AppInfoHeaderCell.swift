//
//  AppInfoHeaderCell.swift
//  AppStore
//
//  Created by Enes Sancar on 30.04.2023.
//

import UIKit
import Kingfisher
import SnapKit

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
    
    private let whatsNewLabel = BodyLabel(text: "What's New", fontSize: 20, weight: .bold)
    
    private let releaseNoteLabel = BodyLabel(fontSize: .systemFont(ofSize: 17), text: "Description", numberOfLines: 0)
    
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
        
        labelStackView = UIStackView(arrangedSubviews: [nameLabel, getButton, UIView()])
        labelStackView.axis = .vertical
        labelStackView.alignment = .leading
        labelStackView.spacing = 12
        
        headStackView = UIStackView(arrangedSubviews: [appIconImageView, labelStackView])
        headStackView.axis = .horizontal
        headStackView.spacing = 12
        
        newStackView = UIStackView(arrangedSubviews: [whatsNewLabel, releaseNoteLabel])
        newStackView.axis = .vertical
        newStackView.spacing = 8
        
        overalStackView = UIStackView(arrangedSubviews: [headStackView, newStackView])
        overalStackView.axis = .vertical
        overalStackView.spacing = 16
    }
    
    private func layout() {
        addSubview(overalStackView)
        
        overalStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        getButton.snp.makeConstraints { make in
            make.bottom.equalTo(appIconImageView).offset(-12)
        }
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
