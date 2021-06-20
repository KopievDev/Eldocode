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

    let catalogArray = ["Телевизоры, аудио, видео","Смартфоны и гаджеты","Компьютеры и ноутбуки","Техника для дома","Техника для кухни","Красота и здоровье","Детские товары","Фото и видео","Игры, софт, развлечения","Товары для авто","Сад и ремонт", "Товары для дома и кухни"]
    let catalogView = CatalogView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(catalogView)
        catalogView.frame = view.frame
        catalogView.catalogTableView.dataSource = self
        
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
