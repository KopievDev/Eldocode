//
//  CompletedVC.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 22.06.2021.
//

import UIKit

class ComletedView: UIView {
    let logoImageView: UIImageView = {
       let iv = UIImageView(image: UIImage(named: "comleted"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Время"
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
        addSubview(logoImageView)
        addSubview(timeLabel)
        backgroundColor = .white
        NSLayoutConstraint.activate([
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 218),
            
            timeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            timeLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: logoImageView.trailingAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 100),


        ])
        alpha = 0
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goOut)))
    }
    @objc func goOut() {
        self.removeFromSuperview()
    }
}
