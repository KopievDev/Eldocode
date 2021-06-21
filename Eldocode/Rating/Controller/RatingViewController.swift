//
//  RatingViewController.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit

class RatingViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ratingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RaitingCell.id, for: indexPath) as? RaitingCell else { return UITableViewCell()}
        
        cell.nameLabel.text = ratingArray[indexPath.row].name
        cell.numberLabel.text = "\(ratingArray[indexPath.row].number)"
        
        configureStar(from: cell, with: indexPath)
        return cell
    }
    

    func configureStar(from cell: RaitingCell, with indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            cell.starImageView.isHidden = false
            cell.starImageView.image = UIImage(named: "first")
        case 1:
            cell.starImageView.isHidden = false
            cell.starImageView.image = UIImage(named: "second")
        case 2:
            cell.starImageView.isHidden = false
            cell.starImageView.image = UIImage(named: "third")
        case 5:
            cell.starImageView.isHidden = false
            cell.starImageView.image = UIImage(named: "myRect")
            cell.nameLabel.text! += " - Вы"
            cell.numberLabel.textColor = .white

        default:
            cell.numberLabel.font = UIFont.systemFont(ofSize: 13)
            cell.numberLabel.textColor = .black
            cell.starImageView.isHidden = true
        }
    }
    let ratingView = RatingView()
    
    init() {
          super.init(nibName: nil, bundle: nil)
          tabBarItem = UITabBarItem(title: "Рейтинг", image: #imageLiteral(resourceName: "rating"), tag: 1)
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(ratingView)
        ratingView.frame = view.frame
        ratingView.raitingTableView.dataSource = self
        ratingView.selectShopButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    
    @objc func showAlert() {
        let alert = UIAlertController(title: "Эльдорадо", message: "Выберите новый магазин", preferredStyle: .actionSheet)
        let okButton = UIAlertAction(title: "В другой раз", style: .cancel) { _ in
            print("магазин уже выбран")
        }
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}
