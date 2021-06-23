//
//  GoBasketButton.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 22.06.2021.
//

import UIKit

class GoBasketButton: UIView {
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13)
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Товар добавлен в корзину"
        return label
    }()
    
    let goLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.208, green: 0.722, blue: 0.314, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Перейти"
        label.isUserInteractionEnabled = true
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
        addSubview(bodyLabel)
        addSubview(goLabel)
        alpha = 0
        backgroundColor = UIColor(red: 0.2, green: 0.235, blue: 0.271, alpha: 1)
        bodyLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(remove)))
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(remove)))

        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            bodyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            bodyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            goLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            goLabel.leadingAnchor.constraint(equalTo: bodyLabel.trailingAnchor),
            goLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            goLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),

        ])
        
    }
    
    @objc func remove() {
        removeFromSuperview()
    }
}
