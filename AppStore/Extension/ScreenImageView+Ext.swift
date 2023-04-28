//
//  ScreenImageView.swift
//  AppStore
//
//  Created by Enes Sancar on 28.04.2023.
//

import UIKit

class ScreenImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 12
        clipsToBounds = true
        contentMode = .scaleAspectFill
        
        layer.borderWidth = 0.85
        layer.borderColor = UIColor.darkGray.cgColor
    }
}
