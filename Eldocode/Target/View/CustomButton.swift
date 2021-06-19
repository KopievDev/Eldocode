//
//  CustomButton.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 19.06.2021.
//

import UIKit

class CustomButton: UIButton {

    let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Улучши\nобщение\nс клиентами"
        return label
    }()
    
    let logoImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "star"))
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
        addSubview(logoImageView)
        createConstaints()
    }
    
    func createConstaints() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            heightAnchor.constraint(equalToConstant: 107),
            widthAnchor.constraint(equalToConstant: 104),
            
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            logoImageView.heightAnchor.constraint(equalToConstant: 16),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor),

            
        ])
    }


}
