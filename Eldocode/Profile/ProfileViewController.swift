//
//  ProfileViewController.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            let cell = tableView.cellForRow(at: indexPath)
            goOut(sender: cell?.contentView ?? UIView())
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    init() {
          super.init(nibName: nil, bundle: nil)
          tabBarItem = UITabBarItem(title: "Профиль", image: #imageLiteral(resourceName: "profileBar"), tag: 4)
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
        profileView.exitButton.addTarget(self, action: #selector(goOut(sender:)), for: .touchUpInside)
        profileView.settingsTableView.delegate = self
    }
    
    @objc func goOut(sender: UIView) {
        animateView(sender)
        let alert = UIAlertController(title: "Эльдорадо", message: "Выйти из аккаунта?", preferredStyle: .actionSheet)
        let okButton = UIAlertAction(title: "Да", style: .default) { [weak self] _ in
            self?.exitNow()
        }
        let cancelButton = UIAlertAction(title: "Нет", style: .cancel)
        
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        present(alert, animated: true)
        
    }
    
    func exitNow() {
        let auth = AuthViewController()
        let authNavigation = UINavigationController(rootViewController: auth)

        authNavigation.modalPresentationStyle = .fullScreen
        present(authNavigation, animated: true)

    }
    
    private func animateView(_ viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: .curveEaseIn) {
            viewToAnimate.transform = .identity
            
        }
    }
 
}
