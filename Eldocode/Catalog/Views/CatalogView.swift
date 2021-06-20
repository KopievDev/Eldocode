//
//  CatalogView.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit

class CatalogView: UIView {

    let searchTextfield: UITextField = {
        let textfield = UITextField()
        textfield.font = .systemFont(ofSize: 13)
        textfield.clearButtonMode = .whileEditing
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.leftViewMode = .always
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 10
        textfield.autocorrectionType = .no
        textfield.keyboardType = .emailAddress
        textfield.setIcon(UIImage(named:"find"))
        textfield.returnKeyType = .go
        textfield.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        textfield.attributedPlaceholder = NSAttributedString(string: "Найти товар или бренд", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.475, green: 0.475, blue: 0.478, alpha: 1)])
        return textfield
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Каталог"
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = UIColor(red: 0.467, green: 0.749, blue: 0.263, alpha: 1)
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:12"
        label.clipsToBounds = true
        return label
    }()

    
 
    
    let catalogTableView: UITableView = {
        let table = UITableView()
        table.register(CatalogCell.self, forCellReuseIdentifier: CatalogCell.id)
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        table.estimatedRowHeight = 48
        return table
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
        addSubview(searchTextfield)
        addSubview(titleLabel)
        addSubview(catalogTableView)
        addSubview(timeLabel)
        createConstaints()
        backgroundColor = .white
        
    }
    
    func createConstaints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            searchTextfield.heightAnchor.constraint(equalToConstant: 40),

            searchTextfield.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            searchTextfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchTextfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
         
            
            catalogTableView.topAnchor.constraint(equalTo: searchTextfield.bottomAnchor, constant: 10),
            catalogTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            catalogTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            catalogTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            timeLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: 28),
            timeLabel.widthAnchor.constraint(equalToConstant: 64),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
            

        ])
        
    }

}
