//
//  TargetViewController.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 19.06.2021.
//

import UIKit

class TargetViewController: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "Цели"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let hotGoodsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Горящие товары"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let hotGoodsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    
    let progress = ProgressBar()
    let salesView = SalesProgramView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
 
    
    func setUp() {
        view.addSubview(progress)
        view.addSubview(salesView)
        view.addSubview(titleLabel)
        view.addSubview(hotGoodsLabel)
        view.addSubview(hotGoodsButton)
        progress.translatesAutoresizingMaskIntoConstraints = false
        salesView.translatesAutoresizingMaskIntoConstraints = false
        createConstaraints()
    }
    
    
    func createConstaraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: progress.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: progress.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            progress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            progress.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            progress.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 40),
            
            salesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            salesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            salesView.topAnchor.constraint(equalTo: progress.bottomAnchor, constant: 80),
            
            hotGoodsLabel.topAnchor.constraint(equalTo: salesView.bottomAnchor, constant: 20),
            hotGoodsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            hotGoodsLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            hotGoodsButton.centerYAnchor.constraint(equalTo: hotGoodsLabel.centerYAnchor),
            hotGoodsButton.heightAnchor.constraint(equalTo: hotGoodsLabel.heightAnchor),
            hotGoodsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27),
            
            
            
        ])
    }
}
