//
//  AppsHeaderViewCell.swift
//  AppStore
//
//  Created by Enes Sancar on 29.04.2023.
//

import UIKit
import Kingfisher

class AppsHeaderViewCell: UICollectionViewCell {
    static let identifier = "AppsHeaderViewCell"
    
    var appHeaderModel: AppHeaderModel? {
        didSet {
            configure()
        }
    }
    
    //MARK: - Properties
   
    private var stackView: UIStackView!
    private let firmLabel = BodyLabel(fontSize: 13, weight: .bold, textColor: .blue, numberOfLines: 1)
    private let titleLabel = BodyLabel(fontSize: .systemFont(ofSize: 24))
    private let appImage = IconImageView(cornerRadius: 8)
    
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
extension AppsHeaderViewCell {
    private func style() {
        
        stackView = UIStackView(arrangedSubviews: [firmLabel, titleLabel, appImage])
        stackView.axis = .vertical
        stackView.spacing = 12
    }
    
    private func layout() {
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(16)
        }
    }
    
    private func configure() {
        guard let result = appHeaderModel else {
            return
        }
        let viewModel = AppsHeaderViewModel(result: result)
        self.firmLabel.text = viewModel.name
        self.titleLabel.text = viewModel.title
        self.appImage.kf.setImage(with: viewModel.imageUrl)
    }
}
