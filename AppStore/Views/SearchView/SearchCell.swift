//
//  SearchCell.swift
//  AppStore
//
//  Created by Enes Sancar on 27.04.2023.
//

import UIKit
import Kingfisher

class SearchCell: UICollectionViewCell {
    static let identifier = "SearchCell"
    
    //MARK: - Properties
    
    var result: Results? {
        didSet {
            configure()
        }
    }
    
    private let screenImageView1 = ScreenImageView(frame: .zero)
    private let screenImageView2 = ScreenImageView(frame: .zero)
    private let screenImageView3 = ScreenImageView(frame: .zero)
    
    private let appIconImageView = IconImageView(height: 64, width: 64, cornerRadius: 12)
    private let nameLabel = BodyLabel()
    private let categoryLabel = BodyLabel()
    private let ratingsLabel = BodyLabel() 
    private lazy var getButton = GetButton()
    
    private var headerStackView: UIStackView!
    private var labelStackView: UIStackView!
    private var screenStackView: UIStackView!
    private var overalStackView: UIStackView!
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame:.zero)
        configure()
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Helpers
extension SearchCell {
    
    private func style() {
        labelStackView = UIStackView(arrangedSubviews: [
            nameLabel, categoryLabel, ratingsLabel
        ])
        labelStackView.distribution = .fillEqually
        labelStackView.axis = .vertical
        
        headerStackView = UIStackView(arrangedSubviews: [
            appIconImageView, labelStackView, getButton
        ])
        headerStackView.spacing = 12
        headerStackView.axis = .horizontal
        headerStackView.alignment = .center
        
        screenStackView = UIStackView(arrangedSubviews: [
            screenImageView1, screenImageView2, screenImageView3
        ])
        screenStackView.axis = .horizontal
        screenStackView.spacing = 8
        screenStackView.distribution = .fillEqually
        
        overalStackView = UIStackView(arrangedSubviews: [
            headerStackView, screenStackView
        ])
        overalStackView.translatesAutoresizingMaskIntoConstraints = false
        overalStackView.axis = .vertical
        overalStackView.spacing = 8
    }
    
    private func layout() {
        addSubview(overalStackView)
        NSLayoutConstraint.activate([
            overalStackView.topAnchor.constraint(equalTo: topAnchor),
            overalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            overalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            overalStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configure() {
        guard let result = self.result else {
            return
        }
        let viewModel = SearchCellViewModel(result: result)
        
        self.nameLabel.text = viewModel.nameLabel
        self.ratingsLabel.text = viewModel.ratingLabel
        self.categoryLabel.text = viewModel.categoryLabel
        
        self.appIconImageView.kf.setImage(with: viewModel.appImage)
        
        self.screenImageView1.kf.setImage(with: viewModel.screenshot1)
        self.screenImageView2.kf.setImage(with: viewModel.screenshot2)
        self.screenImageView3.kf.setImage(with: viewModel.screenshot3)
    }
}
