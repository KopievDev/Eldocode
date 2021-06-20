//
//  HotGoodsCell.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 19.06.2021.
//

import UIKit

class HotGoodsCell: UICollectionViewCell {
    
    static let id = "HotGoods"
    
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
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "96 800₽"
        return label
    }()

    private let discountLabel: UILabel = {
        let label = UILabel()
        label.text = "-20%"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.backgroundColor = UIColor(red: 0.208, green: 0.722, blue: 0.314, alpha: 1)
        label.layer.cornerRadius = 21
        label.clipsToBounds = true
        return label
    }()

    
    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "ipad"))
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
        addSubview(nameLabel)
        addSubview(descLabel)
        addSubview(imageView)
        addSubview(oldPriceLabel)
        addSubview(newPriceLabel)
        addSubview(discountLabel)
        createConstaints()
    }
    
    func createConstaints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            descLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descLabel.widthAnchor.constraint(equalToConstant: 145),
            
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            imageView.heightAnchor.constraint(equalToConstant: 114),
            imageView.widthAnchor.constraint(equalToConstant: 96),
            
            heightAnchor.constraint(equalToConstant: 138),
            widthAnchor.constraint(equalToConstant: 289),
            
            oldPriceLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 9),
            oldPriceLabel.leadingAnchor.constraint(equalTo: descLabel.leadingAnchor),
            
            
            newPriceLabel.topAnchor.constraint(equalTo: oldPriceLabel.bottomAnchor, constant: 9),
            newPriceLabel.leadingAnchor.constraint(equalTo: descLabel.leadingAnchor),
            
            discountLabel.heightAnchor.constraint(equalToConstant: 42),
            discountLabel.widthAnchor.constraint(equalToConstant: 42),
            discountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 120),
            discountLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
        ])
    }
}
