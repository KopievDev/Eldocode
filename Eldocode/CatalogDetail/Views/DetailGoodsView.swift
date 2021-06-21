//
//  DetailGoodsView.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 21.06.2021.
//


import UIKit

class DetailGoodsView: UIView {

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
        textfield.setRightIcon(UIImage(named: "scan"))
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
        label.text = "00:00"
        label.isHidden = true
        label.clipsToBounds = true
        return label
    }()
    
    let catalogTableView: UITableView = {
        let table = UITableView()
        table.register(GoodsCell.self, forCellReuseIdentifier: GoodsCell.id)
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
//        table.estimatedRowHeight = 48
        return table
    }()
    
    // TimeButtom
    lazy var startTimeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.467, green: 0.749, blue: 0.263, alpha: 1)
        button.layer.cornerRadius = 28
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "time"), for: .normal)
        // Тень
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = CGSize(width: 2, height: 4)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowPath = UIBezierPath(roundedRect: button.bounds, cornerRadius: button.frame.width / 2).cgPath
        button.layer.masksToBounds = false
        button.isHidden = true
        
        return button
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
        addSubview(startTimeButton)
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
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            startTimeButton.heightAnchor.constraint(equalToConstant: 56),
            startTimeButton.widthAnchor.constraint(equalToConstant: 56),
            startTimeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            startTimeButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -100),

            

        ])
        
    }

}
