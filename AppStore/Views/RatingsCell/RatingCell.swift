//
//  RatingCell.swift
//  AppStore
//
//  Created by Enes Sancar on 3.05.2023.
//

import UIKit
import SnapKit

class RatingCell: UICollectionViewCell {
    static let identifier = "RatingCell"
    
    //MARK: - Properties
    var resultsEntry: [Entry] = [] {
        didSet {
            ratingCellVC.resultsEntry = resultsEntry
        }
    }
    
    let ratingLabel = BodyLabel(text: "Review & Ratings", fontSize: 19, weight: .bold)
    private let ratingCellVC = RatingsCellVC()
    
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
extension RatingCell {
    private func style() {
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingCellVC.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubview(ratingLabel)
        addSubview(ratingCellVC.view)
        
        ratingLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
        
        ratingCellVC.view.snp.makeConstraints { make in
            make.top.equalTo(ratingLabel.snp_bottomMargin).offset(8)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
