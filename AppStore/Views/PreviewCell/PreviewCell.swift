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
        
    }
    
    private func layout() {
        
    }
}
