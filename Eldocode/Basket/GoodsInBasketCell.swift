//
//  GoodsInBasketCell.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 22.06.2021.
//

import UIKit

class GoodsInBasketCell: UITableViewCell {
    
    static let id = "GoodsInBasketCell"
    
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
    
    let plusImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "plus"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let minusImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "minus"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let deleteImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "deleteGoods"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1 шт."
        return label
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
        addSubview(plusImageView)
        addSubview(minusImageView)
        addSubview(deleteImageView)
        addSubview(countLabel)
        createConstaints()
    }
    
    func createConstaints() {
        NSLayoutConstraint.activate([
            
            goodsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            goodsImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            goodsImageView.widthAnchor.constraint(equalToConstant: 80),
            goodsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 37),
            goodsImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -62),

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

            plusImageView.heightAnchor.constraint(equalToConstant: 30),
            plusImageView.widthAnchor.constraint(equalToConstant: 30),
            plusImageView.leadingAnchor.constraint(equalTo: newPriceLabel.leadingAnchor),
            plusImageView.topAnchor.constraint(equalTo: newPriceLabel.bottomAnchor, constant: 16),
            plusImageView.trailingAnchor.constraint(equalTo: minusImageView.leadingAnchor, constant: -62),
            
            
            minusImageView.heightAnchor.constraint(equalToConstant: 30),
            minusImageView.widthAnchor.constraint(equalToConstant: 30),
            minusImageView.topAnchor.constraint(equalTo: newPriceLabel.bottomAnchor, constant: 16),
            
            deleteImageView.heightAnchor.constraint(equalToConstant: 15),
            deleteImageView.widthAnchor.constraint(equalToConstant: 15),
            deleteImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            deleteImageView.centerYAnchor.constraint(equalTo: minusImageView.centerYAnchor),
            
            countLabel.trailingAnchor.constraint(equalTo: minusImageView.leadingAnchor, constant: 0),
            countLabel.leadingAnchor.constraint(equalTo: plusImageView.trailingAnchor, constant: 0),

            countLabel.topAnchor.constraint(equalTo: minusImageView.topAnchor),
            countLabel.bottomAnchor.constraint(equalTo: minusImageView.bottomAnchor)


        ])
    }
}
