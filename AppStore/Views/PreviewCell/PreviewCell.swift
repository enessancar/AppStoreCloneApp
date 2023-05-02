//
//  PreviewCell.swift
//  AppStore
//
//  Created by Enes Sancar on 1.05.2023.
//

import UIKit

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
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Helpers
extension PreviewCell {
    private func style() {
        previewLabel.translatesAutoresizingMaskIntoConstraints = false
        previewCellVC.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubview(previewLabel)
        addSubview(previewCellVC.view)
        
        NSLayoutConstraint.activate([
            previewLabel.topAnchor.constraint(equalTo: topAnchor),
            previewLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            previewLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            previewCellVC.view.topAnchor.constraint(equalTo: previewLabel.bottomAnchor),
            previewCellVC.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            previewCellVC.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            previewCellVC.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
