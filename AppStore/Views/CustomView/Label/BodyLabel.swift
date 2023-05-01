//
//  BodyLabel.swift
//  AppStore
//
//  Created by Enes Sancar on 1.05.2023.
//

import UIKit

class BodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(fontSize: UIFont) {
        self.init(frame: .zero)
        self.font = fontSize
    }
    
    convenience init(fontSize: CGFloat, weight: UIFont.Weight, textColor: UIColor, numberOfLines: Int) {
        self.init(frame: .zero)
        
        self.font = .systemFont(ofSize: fontSize, weight: weight)
        self.textColor = textColor
        self.numberOfLines = numberOfLines
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
