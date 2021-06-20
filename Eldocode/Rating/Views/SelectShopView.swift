//
//  SelectShopView.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit

class SelectShopView: UIButton {

    
    let shopLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Омск, 70 лет Октября 25 к1"
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.475, green: 0.475, blue: 0.478, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Изменить магазин"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        addSubview(shopLabel)
        addSubview(descLabel)
        createConstaints()
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.824, green: 0.824, blue: 0.824, alpha: 1).cgColor
    }
    
    func createConstaints() {
        NSLayoutConstraint.activate([
            
            heightAnchor.constraint(equalToConstant: 60),
            shopLabel.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            shopLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            descLabel.leadingAnchor.constraint(equalTo: shopLabel.leadingAnchor),
            descLabel.topAnchor.constraint(equalTo: shopLabel.bottomAnchor, constant: 2),
        ])
        
    }

}
