//
//  RatingViewController.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit



class RatingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? RaitingCell else {return}
        
        guard let cardViewFrame = cell.contentView.superview?.convert(cell.contentView.frame, to: nil) else { return}
        let copyOfCardView = UIView(frame: cardViewFrame)
        copyOfCardView.layer.cornerRadius = cell.contentView.layer.cornerRadius
        copyOfCardView.backgroundColor = #colorLiteral(red: 0.8195267916, green: 0.8196654916, blue: 0.8410086036, alpha: 1)
        view.addSubview(copyOfCardView)
        zoomTransitionManager = ZoomTransitionManager(cardView: copyOfCardView, cardViewFrame: cardViewFrame)
        
        
        UIView.animate(withDuration: 0.2, animations: {
            copyOfCardView.layer.cornerRadius = 0
            copyOfCardView.frame = self.view.frame
            
        }, completion: {[weak self] _ in
           let user =  ratingArray[indexPath.row]
            self?.goToNextVC(with: user)
        })
        
        tableView.deselectRow(at: indexPath, animated: true)
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
    var zoomTransitionManager: ZoomTransitionManager!

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
        ratingView.raitingTableView.delegate = self
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

extension RatingViewController: DetailRatingDelegate {
    //MARK: - Go to  SecondVC
    private func goToNextVC(with user: RatingName) {
        
        let secondVC = DetailRatingViewController()
        secondVC.delegate = self
        secondVC.configure(with: user)
        secondVC.modalPresentationStyle = .overCurrentContext
        secondVC.modalTransitionStyle = .crossDissolve
        present(secondVC, animated: true, completion: nil)
        
    }

    func didGoBack() {
        UIView.animate(withDuration: 0.2, animations: {
            self.zoomTransitionManager.cardView.frame = self.zoomTransitionManager.cardViewFrame
            self.zoomTransitionManager.cardView.layer.cornerRadius = 16

        }, completion: { _ in
            self.zoomTransitionManager.cardView.removeFromSuperview()
        })
    }
}
