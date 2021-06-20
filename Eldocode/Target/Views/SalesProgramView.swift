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
        
        createConstaints()
    }
    
    func createConstaints() {
        NSLayoutConstraint.activate([
            planLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            planLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            planLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            planLabel.heightAnchor.constraint(equalToConstant: 20),
            
            heightAnchor.constraint(equalToConstant: 125)
            
        ])
    }
}
