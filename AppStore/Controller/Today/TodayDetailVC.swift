//
//  TodayDetailVC.swift
//  AppStore
//
//  Created by Enes Sancar on 3.05.2023.
//

import UIKit

class TodayDetailVC: UITableViewController {
    
    //MARK: - Properties
    private let detailImageView = IconImageView(cornerRadius: 14)
    private var todayDetailViewModel: TodayDetailViewModel?
    
    var today: Today? {
        didSet {
            configure()
        }
    }
    
    //MARK: - Lifecycle
    init() {
        super.init(style: .grouped)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.cornerRadius = 14
    }
}

//MARK: - Helpers
extension TodayDetailVC {
    private func setup() {
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(TodayDetailCell.self, forCellReuseIdentifier: TodayDetailCell.identifier)
        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    private func configure() {
        guard let today = self.today else {
            return
        }
        detailImageView.contentMode = .scaleAspectFill
        detailImageView.image = UIImage(named: today.imageName)
        self.todayDetailViewModel = TodayDetailViewModel(today: today)
        tableView.reloadData()
    }
}

//MARK: - UITableViewDataSource
extension TodayDetailVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodayDetailCell.identifier, for: indexPath) as? TodayDetailCell else {
            fatalError()
        }
        cell.today = self.todayDetailViewModel
        return cell
    }
}

//MARK: - UITableViewHeader
extension TodayDetailVC {
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        detailImageView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        400
    }
}
