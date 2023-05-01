//
//  GetButton.swift
//  AppStore
//
//  Created by Enes Sancar on 1.05.2023.
//

import UIKit

class GetButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        setTitle("GET", for: .normal)
        setTitleColor(.blue, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 14)
        layer.cornerRadius = 16
        backgroundColor = UIColor(white: 0.90, alpha: 1)
        configSize(height: 32, width: 80)
    }
}
