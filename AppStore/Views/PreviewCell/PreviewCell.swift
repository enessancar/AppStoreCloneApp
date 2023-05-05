//
//  PreviewCell.swift
//  AppStore
//
//  Created by Enes Sancar on 1.05.2023.
//

import UIKit
import SnapKit

class PreviewCell: UICollectionViewCell {
    static let identifier = "PreviewCell"
    
    //MARK: - Properties
    var resultsImage: [String] = [] {
        didSet {
            previewCellVC.resultsImage = resultsImage    
        }
    }
    
    private let previewLabel = BodyLabel(text: "Preview", fontSize: 20, weight: .bold)
    private let previewCellVC = PreviewCellVC()
    
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
extension PreviewCell {
    
    
    private func layout() {
        addSubview(previewLabel)
        addSubview(previewCellVC.view)
        
        previewLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        previewCellVC.view.snp.makeConstraints { make in
            make.top.equalTo(previewLabel.snp_bottomMargin).offset(8)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
