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

    var timerIsActive = false
    var seconds = 0
    var minuts = 0
    var timer = Timer()
    let catalogArray = ["Телевизоры, аудио, видео","Смартфоны и гаджеты","Компьютеры и ноутбуки","Техника для дома","Техника для кухни","Красота и здоровье","Детские товары","Фото и видео","Игры, софт, развлечения","Товары для авто","Сад и ремонт", "Товары для дома и кухни"]
    let catalogView = CatalogView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(catalogView)
        catalogView.frame = view.frame
        catalogView.catalogTableView.dataSource = self
        catalogView.startTimeButton.addTarget(self, action: #selector(startTimer(sender:)), for: .touchUpInside )
    }
    
    @objc func startTimer(sender: UIButton){
        animateView(sender)
        if timerIsActive == false {
            timerIsActive = true
            timer(on: true)
            catalogView.startTimeButton.backgroundColor = UIColor(red: 0.757, green: 0.008, blue: 0.188, alpha: 1)
            catalogView.startTimeButton.setImage(UIImage(named: "stopTime"), for: .normal)
        } else {
            timerIsActive = false
            timer(on: false)
            catalogView.startTimeButton.backgroundColor = UIColor(red: 0.467, green: 0.749, blue: 0.263, alpha: 1)
            catalogView.startTimeButton.setImage(UIImage(named: "time"), for: .normal)
        }
    }
    
    func timer(on: Bool) {
        if on {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {[weak self] timer in
                        guard let `self` = self else {return}
                        self.seconds += 1
                        DispatchQueue.main.async {
                            self.catalogView.timeLabel.text = "0\(self.minuts):\(self.seconds)"
                            if self.seconds == 60 {
                                self.minuts += 1
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
   
}

//MARK: - DataSource
extension CatalogViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalogArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CatalogCell.id, for: indexPath) as? CatalogCell else { return UITableViewCell()}
        cell.nameLabel.text = catalogArray[indexPath.row]
        return cell
    }
}
