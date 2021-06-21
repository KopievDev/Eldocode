//
//  AttainmentView.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit

class AttainmentView: UIView {
        
    let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "3 дня"
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.475, green: 0.475, blue: 0.478, alpha: 1)
        label.textAlignment = .left
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ударный режим"
        return label
    }()

    let logoImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "fire"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
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
        addSubview(textLabel)
        addSubview(descLabel)
        addSubview(logoImageView)
        createConstaints()
    }
    
    func createConstaints() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -26),

            descLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: -10),
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            descLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            heightAnchor.constraint(equalToConstant: 64),
            
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            logoImageView.heightAnchor.constraint(equalToConstant: 22),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor),
            
        ])
    }


}
