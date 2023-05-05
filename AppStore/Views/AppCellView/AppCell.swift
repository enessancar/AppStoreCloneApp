//
//  AppCell.swift
//  AppStore
//
//  Created by Enes Sancar on 28.04.2023.
//

import UIKit
import SnapKit

protocol AppCellProtocol: AnyObject {
    func goAppInfoViewController(id: String)
}

class AppCell: UICollectionViewCell {
    static let identifier = "AppCell"
    weak var delegate: AppCellProtocol?
    
    var feed: Feed? {
        didSet {
            configure()
        }
    }
    
    //MARK: - Properties
    private let sectionLabel = BodyLabel(fontSize: 24, weight: .bold, textColor: .label, numberOfLines: 1)
    private let appCellDetailVC = AppCellDetailVC()
    
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

extension AppCell {
    private func style() {
        appCellDetailVC.delegate = self
    }
    
    private func layout() {
        addSubview(sectionLabel)
        addSubview(appCellDetailVC.view)
        
        sectionLabel.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        appCellDetailVC.view.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(sectionLabel.snp_bottomMargin).offset(14)
        }
    }
    
    private func configure() {
        guard let feed = feed else {
            return
        }
        self.sectionLabel.text = feed.title
        self.appCellDetailVC.results = feed.results
    }
}

//MARK: - AppCellDetailVCProtocol
extension AppCell: AppCellDetailVCProtocol {
    func goAppInfoViewController(id: String) {
        delegate?.goAppInfoViewController(id: id)
    }
}
