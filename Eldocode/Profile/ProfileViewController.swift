//
//  ProfileViewController.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CatalogCell.id, for: indexPath) as? CatalogCell else { return UITableViewCell()}
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Настройка уведомлений"
        case 1:
            cell.textLabel?.text = "Изменить магазин"
        default:
            cell.textLabel?.text = "Выйти из аккаунта"
            cell.textLabel?.textColor = UIColor(red: 0.757, green: 0.008, blue: 0.188, alpha: 1)
            cell.accessoryType = .none

        }
        return cell
    }
    
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
        profileView.settingsTableView.dataSource = self
    }
    
}
