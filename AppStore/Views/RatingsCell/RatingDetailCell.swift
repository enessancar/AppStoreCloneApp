//
//  RatingDetailCell.swift
//  AppStore
//
//  Created by Enes Sancar on 3.05.2023.
//

import UIKit
import SnapKit

class RatingDetailCell: UICollectionViewCell {
    static let identifier = "RatingDetailCell"
    
    //MARK: - Properties
    var resultsEntry: Entry? {
        didSet {
            configure()
        }
    }
    
    private let titleLabel = BodyLabel(fontSize: 16, weight: .bold, textColor: .label, numberOfLines: 1)
    private let authorLabel = BodyLabel(fontSize: .systemFont(ofSize: 16))
    private let starsLabel = BodyLabel(fontSize: .systemFont(ofSize: 14))
    private let bodyLabel = BodyLabel(fontSize: .systemFont(ofSize: 14))
    private var stackView: UIStackView!
    
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
extension RatingDetailCell {
    private func style() {
        backgroundColor = .systemGroupedBackground
        bodyLabel.numberOfLines = 0
        authorLabel.textAlignment = .right
        
        stackView = UIStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [titleLabel, authorLabel]),
            starsLabel,
            bodyLabel,
            UIView()
        ])
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubview(stackView)
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        
        stackView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().offset(20)
        }
        
        NSLayoutConstraint.activate([
           authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
    }
    
    private func configure() {
        guard let results = resultsEntry else {
            return
        }
        let viewModel = RatingDetailCellViewModel(results: results)
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.authorName
        starsLabel.text = viewModel.ratings
        bodyLabel.text = viewModel.content
    }
}
