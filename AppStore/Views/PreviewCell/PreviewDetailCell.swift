//
//  PreviewDetailCell.swift
//  AppStore
//
//  Created by Enes Sancar on 2.05.2023.
//

import UIKit
import Kingfisher
import SnapKit

class PreviewDetailCell: UICollectionViewCell {
    static let identifier = "PreviewDetailCell"
    
    //MARK: - Properties
    var resultImageString: String? {
        didSet {
            configure()
        }
    }
    private let screenShotImageView = IconImageView(cornerRadius: 12)
    
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
extension PreviewDetailCell {
    
    private func layout() {
        addSubview(screenShotImageView)
        
        screenShotImageView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func configure() {
        guard let result = resultImageString else {
            return
        }
        let viewModel = PreviewDetailCellViewModel(results: result)
        screenShotImageView.kf.setImage(with: viewModel.imageUrl)
    }
}
