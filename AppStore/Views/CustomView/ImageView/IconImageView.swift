//
//  IconImageView.swift
//  AppStore
//
//  Created by Enes Sancar on 1.05.2023.
//

import UIKit

class IconImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(cornerRadius: CGFloat) {
        self.init(frame: .zero)
        self.layer.cornerRadius = cornerRadius
    }

    
    convenience init(height: CGFloat, width: CGFloat, cornerRadius: CGFloat) {
        self.init(frame: .zero)
        self.configSize(height: height, width: width)
        self.layer.cornerRadius = cornerRadius
    }
    
    private func configure() {
        clipsToBounds = true
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
    }
}
