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
        
        stackView = UIStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [titleLabel, authorLabel]),
            starsLabel,
            bodyLabel
        ])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubview(stackView)
        
        titleLabel.text = "rwgew"
        authorLabel.text = "rwg"
        bodyLabel.text = "frwgrewgrwgw"
        starsLabel.text = "wrgwrgregregre"
        
        stackView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().offset(20)
        }
    }
}
