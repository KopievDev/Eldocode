//
//  DetailRating.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 23.06.2021.
//

import UIKit

class DetailRatingViewController: UIViewController {
    
    let numberImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "first"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let salesImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "sales"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    

    let numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        return label
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Статистика"
        return label
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "96 800₽"
        return label
    }()
    let saleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Товары"
        return label
    }()
    
    let saleAccesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Аксессуары"
        return label
    }()

    let salesAccesImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "sales2"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    weak var delegate: DetailRatingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goBackTap)))
    }
    
    @objc  func goBackTap(){
        print("TAp")
        guard let delegate = delegate else { return }
        delegate.didGoBack()
        dismiss(animated: true, completion: nil)
    }
    
    func configure(with user: RatingName) {
        nameLabel.text = user.name
        numberLabel.text = "\(user.number)"
        
        switch user.number {
        case 1:
            numberImageView.image = UIImage(named: "first")
        case 2:
            numberImageView.image = UIImage(named: "second")
        case 3:
            numberImageView.image = UIImage(named: "third")
        default:
            numberImageView.isHidden = true
        }
    }
    
    func setUp() {
        view.addSubview(nameLabel)
        view.addSubview(numberImageView)
        view.addSubview(numberLabel)
        view.addSubview(titleLabel)
        view.addSubview(salesImageView)
        view.addSubview(saleLabel)
        view.addSubview(saleAccesLabel)
        view.addSubview(salesAccesImageView)

        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            numberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            numberLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            numberLabel.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor,constant: -10),
            numberLabel.heightAnchor.constraint(equalToConstant: 20),
            numberLabel.widthAnchor.constraint(equalToConstant: 20),
            
            numberImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            numberImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            numberImageView.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor,constant: -10),
            numberImageView.heightAnchor.constraint(equalToConstant: 20),
            numberImageView.widthAnchor.constraint(equalToConstant: 20),
            
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            saleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            saleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            saleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            saleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            salesImageView.topAnchor.constraint(equalTo: saleLabel.bottomAnchor, constant: 16),
            salesImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            salesImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            salesImageView.heightAnchor.constraint(equalToConstant: 220),
            
            saleAccesLabel.topAnchor.constraint(equalTo: salesImageView.bottomAnchor, constant: 16),
            saleAccesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            saleAccesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            saleAccesLabel.heightAnchor.constraint(equalToConstant: 20),
            
            salesAccesImageView.topAnchor.constraint(equalTo: saleAccesLabel.bottomAnchor, constant: 16),
            salesAccesImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            salesAccesImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            salesAccesImageView.heightAnchor.constraint(equalToConstant: 220),
            
            
            
            


            
        ])
        
    }
    
}
