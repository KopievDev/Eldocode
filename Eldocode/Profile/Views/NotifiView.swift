//
//  NotifiView.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 21.06.2021.
//

import UIKit

class NotifiView: UIView {
        
    let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Так держать, Иван!"
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "В этом месяце вы увеличили средний чек ваших покупателей на 4790 ₽"
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
        layer.cornerRadius = 8
        layer.borderWidth = 0.6
        layer.borderColor = UIColor(red: 0.105, green: 0.638, blue: 0.215, alpha: 1).cgColor
        backgroundColor = UIColor(red: 0.208, green: 0.722, blue: 0.314, alpha: 1)
        addSubview(textLabel)
        addSubview(descLabel)
        createConstaints()
    }
    
    func createConstaints() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 11),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            textLabel.bottomAnchor.constraint(equalTo: descLabel.topAnchor, constant: -6),

//            descLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: -10),
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            descLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -29),
            
//            heightAnchor.constraint(equalToConstant: 64),
            
            
        ])
    }


}
