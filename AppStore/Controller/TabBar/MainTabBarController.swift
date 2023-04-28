//
//  MainTabBarController.swift
//  AppStore
//
//  Created by Enes Sancar on 27.04.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    private func setupVC() {
        viewControllers = [
            createNavController(viewController: TodayViewController(), title: "Today", imageName: "doc.text.image"),
            createNavController(viewController: AppsViewController(), title: "Apps", imageName: "square.stack.3d.up.fill"),
            createNavController(viewController: SearchViewController(), title: "Search", imageName: "magnifyingglass")
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .systemBackground
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        return navController
    }
}
