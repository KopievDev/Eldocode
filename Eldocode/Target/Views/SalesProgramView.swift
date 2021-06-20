//
//  SalesProgramView.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 19.06.2021.
//

import UIKit

class SalesProgramView: UIView {

    let planLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "План продаж на день"
        return label
    }()
    
    let goodsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Товары:"
        return label
    }()
    
    let acсesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Аксессуары:"
        return label
    }()
    
    let serviceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Услуги:"
        return label
    }()
    
    let goodsProcentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "72 %"
        return label
    }()
    
    let accesProcentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "78 %"
        return label
    }()
    
    let serviceProcentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "20 %"
        return label
    }()
    
    let goodsMoneyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "86 990 / 120 000 ₽"
        return label
    }()
    
    let accesMoneyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "23 490 / 30 000 ₽"
        return label
    }()
    
    let serviceMoneyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "3 990 / 20 000 ₽"
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
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1).cgColor
        backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        addSubview(planLabel)
        addSubview(goodsLabel)
        addSubview(acсesLabel)
        addSubview(serviceLabel)
        
        addSubview(goodsProcentLabel)
        addSubview(accesProcentLabel)
        addSubview(serviceProcentLabel)
        
        addSubview(goodsMoneyLabel)
        addSubview(accesMoneyLabel)
        addSubview(serviceMoneyLabel)

        

        createConstaints()
    }
    
    func createConstaints() {
        NSLayoutConstraint.activate([
            planLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            planLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            planLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            planLabel.heightAnchor.constraint(equalToConstant: 20),
            
            heightAnchor.constraint(equalToConstant: 125),
            
            goodsLabel.topAnchor.constraint(equalTo: planLabel.bottomAnchor, constant: 8),
            goodsLabel.leadingAnchor.constraint(equalTo: planLabel.leadingAnchor),
            goodsLabel.trailingAnchor.constraint(equalTo: planLabel.trailingAnchor),
            goodsLabel.heightAnchor.constraint(equalToConstant: 18),
            
            acсesLabel.topAnchor.constraint(equalTo: goodsLabel.bottomAnchor, constant: 8),
            acсesLabel.leadingAnchor.constraint(equalTo: planLabel.leadingAnchor),
            acсesLabel.trailingAnchor.constraint(equalTo: planLabel.trailingAnchor),
            acсesLabel.heightAnchor.constraint(equalToConstant: 18),
            
            serviceLabel.topAnchor.constraint(equalTo: acсesLabel.bottomAnchor, constant: 8),
            serviceLabel.leadingAnchor.constraint(equalTo: planLabel.leadingAnchor),
            serviceLabel.trailingAnchor.constraint(equalTo: planLabel.trailingAnchor),
            serviceLabel.heightAnchor.constraint(equalToConstant: 18),

            goodsProcentLabel.centerYAnchor.constraint(equalTo: goodsLabel.centerYAnchor),
            goodsProcentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            accesProcentLabel.centerYAnchor.constraint(equalTo: acсesLabel.centerYAnchor),
            accesProcentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            serviceProcentLabel.centerYAnchor.constraint(equalTo: serviceLabel.centerYAnchor),
            serviceProcentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            goodsMoneyLabel.centerYAnchor.constraint(equalTo: goodsLabel.centerYAnchor),
            goodsMoneyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            accesMoneyLabel.centerYAnchor.constraint(equalTo: acсesLabel.centerYAnchor),
            accesMoneyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            serviceMoneyLabel.centerYAnchor.constraint(equalTo: serviceLabel.centerYAnchor),
            serviceMoneyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),


            
            
        ])
    }
}
