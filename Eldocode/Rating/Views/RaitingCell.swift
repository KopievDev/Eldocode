//
//  RaitingCell.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit

class RaitingCell: UITableViewCell {

    static let id = "cellId"
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Яковлев Алексей"
        return label
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        return label
    }()
    
    
    let starImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "star.fill"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        addSubview(nameLabel)
        addSubview(starImageView)
        addSubview(numberLabel)
        accessoryType = .disclosureIndicator
        createConstaints()
    }
    
    func createConstaints() {
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
         
            
            starImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            starImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            starImageView.heightAnchor.constraint(equalToConstant: 26),
            starImageView.widthAnchor.constraint(equalToConstant: 26),
            
            numberLabel.heightAnchor.constraint(equalTo: starImageView.heightAnchor),
            numberLabel.widthAnchor.constraint(equalTo: starImageView.widthAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: starImageView.centerYAnchor),
            numberLabel.centerXAnchor.constraint(equalTo: starImageView.centerXAnchor),


            
//            heightAnchor.constraint(equalToConstant: 138),
//            widthAnchor.constraint(equalToConstant: 289)
            
        ])
    }

}
