//
//  CatalogViewController.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit

class CatalogViewController: UIViewController {

    init() {
          super.init(nibName: nil, bundle: nil)
          tabBarItem = UITabBarItem(title: "Каталог", image: #imageLiteral(resourceName: "fillStar"), tag: 2)
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

   
}
