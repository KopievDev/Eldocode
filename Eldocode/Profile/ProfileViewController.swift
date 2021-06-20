//
//  ProfileViewController.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    init() {
          super.init(nibName: nil, bundle: nil)
          tabBarItem = UITabBarItem(title: "Профиль", image: #imageLiteral(resourceName: "star"), tag: 4)
      }
    
    let profileView = ProfileView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileView)
        profileView.frame = view.frame
    }
    
}
