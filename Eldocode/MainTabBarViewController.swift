//
//  MainTabBarViewController.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .fullScreen
        
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = nil
        
        delegate = self
        
//        let competitionVC = UINavigationController(rootViewController: CompetitionsViewController())
        let feedsVC = TargetViewController()
        
        viewControllers = [ feedsVC]
        selectedIndex = 0

        tabBar.tintColor = UIColor(red: 0.918, green: 0.337, blue: 0.086, alpha: 1)
        tabBar.unselectedItemTintColor = .white
        
        tabBar.barTintColor = UIColor(red: 0.035, green: 0.035, blue: 0.188, alpha: 1)
        tabBar.isTranslucent = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
