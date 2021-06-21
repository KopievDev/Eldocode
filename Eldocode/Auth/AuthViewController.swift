//
//  AuthViewController.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit

class AuthViewController: UIViewController {

    let phoneTextfield: UITextField = {
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
        textfield.backgroundColor = UIColor(red: 0.957, green: 0.996, blue: 0.965, alpha: 1)
        textfield.layer.borderWidth = 0.6

        textfield.layer.borderColor = UIColor(red: 0.208, green: 0.722, blue: 0.314, alpha: 1).cgColor
        textfield.attributedPlaceholder = NSAttributedString(string: "Найти товар или бренд", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.475, green: 0.475, blue: 0.478, alpha: 1)])
        return textfield
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Вход по номеру телефона"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(phoneTextfield)
        view.addSubview(phoneTextfield)

        
    }
    
}
