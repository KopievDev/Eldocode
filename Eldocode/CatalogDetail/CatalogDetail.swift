//
//  CatalogDetail.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 21.06.2021.
//

import UIKit

class CatalogDetailViewController: UIViewController {

    var timer = Timer()
    var titleLabel: String = ""
    let catalogView = DetailGoodsView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(catalogView)
        catalogView.frame = view.frame
        catalogView.catalogTableView.dataSource = self
        catalogView.catalogTableView.delegate = self
        catalogView.titleLabel.text = titleLabel
        configureNavigationBar(withTitle: "", image: UIImage(named: "titleLogo")!)
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(named: "basket"), style: .done, target: self, action: #selector(goToBasket)), animated: true)
    }
    
    deinit {
        timer(on: false)
    }
    
   
    @objc func goToBasket() {
        let basketVC = BasketViewController()
        basketVC.catalogView.timeLabel.text = catalogView.timeLabel.text
        if SaleTimer.shared.timerIsActive {
            basketVC.timer(on: true)
        }

        present(basketVC, animated: true)
    }
    
    func timer(on: Bool) {
        if on {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {[weak self] timer in
                guard let `self` = self else {return}
                DispatchQueue.main.async {
                    let time = SaleTimer.shared
                    if time.seconds < 10 {
                        
                        self.catalogView.timeLabel.text = "0\(time.minuts):0\(time.seconds)"
                    } else {
                        self.catalogView.timeLabel.text = "0\(time.minuts):\(time.seconds)"
                    }
                    
                }
            }
        }else {
            timer.invalidate()
        }
    }
    private func animateView(_ viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: .curveEaseIn) {
            viewToAnimate.transform = .identity
            
        }
    }
    func showBasketButton() {
        let goBasket = GoBasketButton()
        self.view.addSubview(goBasket)
        UIView.animate(withDuration: 0.5) {
            goBasket.alpha = 1
        }
        goBasket.translatesAutoresizingMaskIntoConstraints = false
        goBasket.layer.cornerRadius = 8
        goBasket.goLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToBasket)))
        NSLayoutConstraint.activate([
            goBasket.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            goBasket.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            goBasket.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            goBasket.heightAnchor.constraint(equalToConstant: 34),
        ])
    }
}

//MARK: - DataSource
extension CatalogDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goodsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GoodsCell.id, for: indexPath) as? GoodsCell else { return UITableViewCell()}
//        cell.nameLabel.text = "Apple iPad pro"
        let good = goodsArray[indexPath.row]
        cell.configure(with: good)
        switch indexPath.row {
        case 0:
            cell.amauntImageView.image = UIImage(named: "ratingLow")
        default:
            cell.amauntImageView.image = UIImage(named: "rating")
        }
        return cell
    }
}

extension CatalogDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showBasketButton()
    }
}
