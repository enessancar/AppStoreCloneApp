//
//  TodayDetailCell.swift
//  AppStore
//
//  Created by Enes Sancar on 5.05.2023.
//

import UIKit
import SnapKit

class TodayDetailCell: UITableViewCell {
   static let identifier = "TodayDetailCell"
    
    //MARK: - Properties
    var today: TodayDetailViewModel? {
        didSet {
            configure()
        }
    }
    private let headTitleLabel = BodyLabel(fontSize: .boldSystemFont(ofSize: 18), textColor: .darkGray)
    private let subtitleLabel = BodyLabel(fontSize: .boldSystemFont(ofSize: 25), textColor: .darkGray)
    private var labelStackView: UIStackView!
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Helpers
extension TodayDetailCell {
    private func setup() {
        headTitleLabel.numberOfLines = 0
        subtitleLabel.numberOfLines = 0
        
        labelStackView = UIStackView(arrangedSubviews: [headTitleLabel, subtitleLabel])
        labelStackView.axis = .vertical
        labelStackView.spacing = 4
        
    }
    
    private func layout() {
        addSubview(labelStackView)
        
        labelStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview()
        }
    }
    
    private func configure() {
        guard let todayViewModel = self.today else {
            return
        }
        headTitleLabel.attributedText = todayViewModel.title1
        subtitleLabel.attributedText = todayViewModel.title2
    }
}
