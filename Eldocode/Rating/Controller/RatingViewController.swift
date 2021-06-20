//
//  RatingViewController.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit

class RatingViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RaitingCell.id, for: indexPath) as? RaitingCell else { return UITableViewCell()}
        
       configureStar(from: cell, with: indexPath)
        
        return cell
    }
    

    func configureStar(from cell: RaitingCell, with indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            cell.numberLabel.font = UIFont.systemFont(ofSize: 9)
            cell.numberLabel.textColor = .white
            cell.starImageView.isHidden = false
            cell.starImageView.tintColor = UIColor(red: 0.95, green: 0.83, blue: 0.197, alpha: 1)
        case 1:
            cell.numberLabel.font = UIFont.systemFont(ofSize: 9)
            cell.numberLabel.textColor = .white
            cell.starImageView.isHidden = false
            cell.starImageView.tintColor = UIColor(red: 0.727, green: 0.725, blue: 0.742, alpha: 1)
        case 2:
            cell.numberLabel.font = UIFont.systemFont(ofSize: 9)
            cell.numberLabel.textColor = .white
            cell.starImageView.isHidden = false
            cell.starImageView.tintColor = UIColor(red: 0.9, green: 0.729, blue: 0.528, alpha: 1)

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
        
    }
    
}
