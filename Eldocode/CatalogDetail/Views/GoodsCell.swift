//
//  GoodsCell.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 21.06.2021.
//

import UIKit

class GoodsCell: UITableViewCell {
    
    static let id = "GoodsCell"
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Apple iPad pro"
        return label
    }()
    let descLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2020 год\n12.9” Wi - Fi 128 GB"
        return label
    }()
    
    let oldPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.475, green: 0.475, blue: 0.478, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "120 990 ₽ ")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        label.attributedText = attributeString
        return label
    }()
    
    let newPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "96 800₽"
        return label
    }()


    
    let goodsImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "ipad"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let amauntImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "rating"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let basketImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "basket"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
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
        addSubview(descLabel)
        addSubview(goodsImageView)
        addSubview(oldPriceLabel)
        addSubview(newPriceLabel)
        addSubview(amauntImageView)
        addSubview(basketImageView)

        createConstaints()
    }
    
    func createConstaints() {
        NSLayoutConstraint.activate([
            
            goodsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            goodsImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            goodsImageView.widthAnchor.constraint(equalToConstant: 80),
            goodsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 37),
            goodsImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            nameLabel.topAnchor.constraint(equalTo: goodsImageView.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: goodsImageView.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            nameLabel.heightAnchor.constraint(equalToConstant: 18),

            descLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            descLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descLabel.widthAnchor.constraint(equalToConstant: 145),
            
            newPriceLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 9),
            newPriceLabel.leadingAnchor.constraint(equalTo: descLabel.leadingAnchor),
            
            oldPriceLabel.bottomAnchor.constraint(equalTo: newPriceLabel.bottomAnchor),
            oldPriceLabel.leadingAnchor.constraint(equalTo: newPriceLabel.trailingAnchor, constant: 7),

            amauntImageView.heightAnchor.constraint(equalToConstant: 20),
            amauntImageView.widthAnchor.constraint(equalToConstant: 20),
            amauntImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
            amauntImageView.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            
            basketImageView.heightAnchor.constraint(equalToConstant: 20),
            basketImageView.widthAnchor.constraint(equalToConstant: 20),
            basketImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
            basketImageView.topAnchor.constraint(equalTo: amauntImageView.bottomAnchor, constant: 30 ),
            
        ])
    }
}
