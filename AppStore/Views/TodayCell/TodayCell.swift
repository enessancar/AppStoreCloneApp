//
//  TodayCell.swift
//  AppStore
//
//  Created by Enes Sancar on 3.05.2023.
//

import UIKit
import SnapKit

class TodayCell: UICollectionViewCell {
    static let identifier = "TodayCell"
    
    var today: Today? {
        didSet {
            configure()
        }
    }
    
    //MARK: - Properties
    private let imageView = IconImageView(cornerRadius: 14)
    private let titleLabel = BodyLabel(fontSize: .boldSystemFont(ofSize: 25), textColor: .darkGray)
    private let featureTitleLabel = BodyLabel(fontSize: .boldSystemFont(ofSize: 18), textColor: .darkGray)
    private var labelStackView: UIStackView!
    
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
extension TodayCell {
    private func style() {
        layer.cornerRadius = 12
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        labelStackView = UIStackView(arrangedSubviews: [featureTitleLabel, titleLabel])
        labelStackView.axis = .vertical
        labelStackView.spacing = 4
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubview(imageView)
        addSubview(labelStackView)
        
        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        labelStackView.snp.makeConstraints { make in
            make.top.equalTo(snp_topMargin).offset(8)
            make.leading.equalTo(snp_leadingMargin).offset(8)
            make.trailing.equalToSuperview()
        }
    }
    
    private func configure() {
        guard let today = today else {
            return
        }
        self.featureTitleLabel.text = today.featuredTitle
        self.titleLabel.text = today.headTitle
        self.imageView.image = UIImage(named: today.imageName)
    }
}
