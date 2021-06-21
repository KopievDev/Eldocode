//
//  AuthViewController.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit

class AuthViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "auth", image: #imageLiteral(resourceName: "serb"), tag: 5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        
        textfield.leftViewMode = .always
        textfield.setRightIcon(UIImage(named: "delete"))
        textfield.returnKeyType = .go
        textfield.backgroundColor = UIColor(red: 0.957, green: 0.996, blue: 0.965, alpha: 1)
        textfield.layer.borderWidth = 0.6

        textfield.layer.borderColor = UIColor(red: 0.208, green: 0.722, blue: 0.314, alpha: 1).cgColor
        textfield.attributedPlaceholder = NSAttributedString(string: "+7 (999) 999 99-99", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.475, green: 0.475, blue: 0.478, alpha: 1)])
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
    
    let enterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.208, green: 0.722, blue: 0.314, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Получить код", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(phoneTextfield)
        view.addSubview(enterButton)

        createConstraints()
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 46),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -46),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            
            phoneTextfield.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            phoneTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            phoneTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            phoneTextfield.heightAnchor.constraint(equalToConstant: 48),

            enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            enterButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -34),
            enterButton.heightAnchor.constraint(equalToConstant: 44)

        ])
    }
}
