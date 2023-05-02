//
//  PreviewDetailCell.swift
//  AppStore
//
//  Created by Enes Sancar on 2.05.2023.
//

import UIKit
import Kingfisher

class PreviewDetailCell: UICollectionViewCell {
    static let identifier = "PreviewDetailCell"
    
    //MARK: - Properties
    var resultImageString: String? {
        didSet {
            configure()
        }
    }
    
    private let screenshotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        return imageView
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

//MARK: - Helpers
extension PreviewDetailCell {
    private func style() {
        screenshotImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubview(screenshotImageView)
        
        NSLayoutConstraint.activate([
            screenshotImageView.topAnchor.constraint(equalTo: topAnchor),
            screenshotImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            screenshotImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            screenshotImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func configure() {
        guard let result = resultImageString else {
            return
        }
        let viewModel = PreviewDetailCellViewModel(results: result)
        screenshotImageView.kf.setImage(with: viewModel.imageUrl)
    }
}
