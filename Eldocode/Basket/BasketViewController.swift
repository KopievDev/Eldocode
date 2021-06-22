//
//  BasketViewController.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 22.06.2021.
//
import UIKit

class BasketViewController: UIViewController {

    var titleLabel: String = "Корзина клиента"
    let catalogView = BasketView()
    var count = 1
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(catalogView)
        catalogView.frame = view.frame
        catalogView.catalogTableView.dataSource = self
        catalogView.catalogTableView.delegate = self
        catalogView.enterButton.addTarget(self, action: #selector(order(sender:)), for: .touchUpInside)
        catalogView.titleLabel.text = titleLabel
        configureNavigationBar(withTitle: "", image: UIImage(named: "titleLogo")!)
       
    }
    
    @objc func order(sender: UIButton) {
        animateView(sender)
        
        
        let completedView = ComletedView(frame: view.frame)
        
        view.addSubview(completedView)
        completedView.timeLabel.text = catalogView.timeLabel.text
        UIView.animate(withDuration: 1) {
            completedView.alpha = 1
        }
        count = 0
        catalogView.catalogTableView.reloadData()
        catalogView.catalogTableView.separatorStyle = .none
        SaleTimer.shared.timer(on: false)
        
        
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
            self.catalogView.timeLabel.text = "00:00"
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
        
}

//MARK: - DataSource
extension BasketViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GoodsInBasketCell.id, for: indexPath) as? GoodsInBasketCell else { return UITableViewCell()}
        cell.nameLabel.text = "Apple iPad pro"
    
        return cell
    }
}

extension BasketViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
