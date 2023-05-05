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
    
    convenience init(fontSize: UIFont, text: String, numberOfLines: Int){
        self.init(frame: .zero)
        self.font = fontSize
        self.text = text
        self.numberOfLines = numberOfLines
    }
    
    convenience init(fontSize: UIFont) {
        self.init(frame: .zero)
        self.font = fontSize
    }
    
    convenience init(fontSize: UIFont, textColor: UIColor) {
        self.init(frame: .zero)
        self.font = fontSize
        self.textColor = textColor
    }
    
    convenience init(text: String, fontSize: CGFloat, weight: UIFont.Weight) {
        self.init(frame: .zero)
        self.text = text
        self.font = .systemFont(ofSize: fontSize, weight: weight)
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
