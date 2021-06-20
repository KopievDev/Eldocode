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
    
 
    
    let raitingTableView: UITableView = {
        let table = UITableView()
        table.register(RaitingCell.self, forCellReuseIdentifier: RaitingCell.id)
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
        addSubview(raitingTableView)
        createConstaints()
        backgroundColor = .white
        
    }
    
    func createConstaints() {
        NSLayoutConstraint.activate([
            searchTextfield.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            searchTextfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchTextfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            searchTextfield.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.topAnchor.constraint(equalTo: searchTextfield.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
         
            
//            raitingTableView.topAnchor.constraint(equalTo: selectShopButton.bottomAnchor),
//            raitingTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            raitingTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            raitingTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            

        ])
        
    }

}
