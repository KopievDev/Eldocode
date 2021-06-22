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
        

        let targetVC = TargetViewController()
        let ratingVC = RatingViewController()
        let chatsVC = ChatsViewController()
        let catalogVC = CatalogViewController()
        let profileVC = ProfileViewController()

        let catalogNavigation = UINavigationController(rootViewController: catalogVC)
        let chatNavigation = UINavigationController(rootViewController: chatsVC)

        UINavigationBar.appearance().tintColor = .black
        
        viewControllers = [ targetVC, ratingVC, catalogNavigation,chatNavigation, profileVC]
        selectedIndex = 0
        tabBar.tintColor = UIColor(red: 0.467, green: 0.749, blue: 0.263, alpha: 1)
        tabBar.unselectedItemTintColor = UIColor(red: 0.302, green: 0.314, blue: 0.333, alpha: 1)
        
        tabBar.barTintColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
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
