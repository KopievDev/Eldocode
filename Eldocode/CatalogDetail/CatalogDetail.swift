//
//  CatalogDetail.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 21.06.2021.
//

import UIKit

class CatalogDetailViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Каталог", image: #imageLiteral(resourceName: "fillStar"), tag: 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var timerIsActive = false
    var seconds = 0
    var minuts = 0
    var timer = Timer()
    var titleLabel: String = ""
    let catalogArray = ["Телевизоры, аудио, видео","Смартфоны и гаджеты","Компьютеры и ноутбуки","Техника для дома","Техника для кухни","Красота и здоровье","Детские товары","Фото и видео","Игры, софт, развлечения","Товары для авто","Сад и ремонт", "Товары для дома и кухни"]
    let catalogView = DetailGoodsView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(catalogView)
        catalogView.frame = view.frame
        catalogView.catalogTableView.dataSource = self
        catalogView.catalogTableView.delegate = self
        catalogView.startTimeButton.addTarget(self, action: #selector(startTimer(sender:)), for: .touchUpInside )
        catalogView.titleLabel.text = titleLabel
        configureNavigationBar(withTitle: "", image: UIImage(named: "titleLogo")!)
    }
    
    @objc func startTimer(sender: UIButton){
        animateView(sender)
        if timerIsActive == false {
            timerIsActive = true
            timer(on: timerIsActive)
            catalogView.startTimeButton.backgroundColor = UIColor(red: 0.757, green: 0.008, blue: 0.188, alpha: 1)
            catalogView.startTimeButton.setImage(UIImage(named: "stopTime"), for: .normal)
            SaleTimer.shared.timer(on: true)
        } else {
            timerIsActive = false
            showAlert()
        }
    }
    
    func timer(on: Bool) {
        if on {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {[weak self] timer in
                guard let `self` = self else {return}
                self.seconds += 1
                DispatchQueue.main.async {
                    if self.seconds < 10 {
                        self.catalogView.timeLabel.text = "0\(self.minuts):0\(self.seconds)"
                    } else {
                        self.catalogView.timeLabel.text = "0\(self.minuts):\(self.seconds)"
                    }
                    if self.seconds == 60 {
                        self.minuts += 1
                        self.seconds = 0
                    }
                }
            }
        }else {
            timer.invalidate()
            minuts = 0
            seconds = 0
            self.catalogView.timeLabel.text = "0\(self.minuts):0\(self.seconds)"
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
    
    @objc func showAlert() {
        let alert = UIAlertController(title: "Эльдорадо", message: "Вы точно хотите завершить заказ без покупки?", preferredStyle: .actionSheet)
        let yesButton = UIAlertAction(title: "Да", style: .default) {[weak self] _ in
            self?.timer.invalidate()
            self?.catalogView.startTimeButton.backgroundColor = UIColor(red: 0.467, green: 0.749, blue: 0.263, alpha: 1)
            self?.catalogView.startTimeButton.setImage(UIImage(named: "time"), for: .normal)
            SaleTimer.shared.timer(on: false)
            self?.seconds = 0
            self?.minuts = 0
            self?.catalogView.timeLabel.text = "0\(self?.minuts ?? 0):0\(self?.seconds ?? 0)"
            
        }
        let noButton = UIAlertAction(title: "Нет", style: .cancel)
        alert.addAction(yesButton)
        alert.addAction(noButton)
        present(alert, animated: true)
    }
    
}

//MARK: - DataSource
extension CatalogDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalogArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GoodsCell.id, for: indexPath) as? GoodsCell else { return UITableViewCell()}
        cell.nameLabel.text = "Apple iPad pro"
        
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
    }
}
