//
//  ProfileView.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit

class ProfileView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Профиль"
        return label
    }()
    
    // exit button
    let exitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "exit"), for: .normal)
        button.layer.masksToBounds = false
        return button
    }()
    
    // Image of contacts
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 128 / 2
        iv.contentMode = .center
        iv.backgroundColor = UIColor(red: 0.467, green: 0.749, blue: 0.263, alpha: 1)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "profile")
        return iv
    }()
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Привет, Иван"
        return label
    }()
    
    let planLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.475, green: 0.475, blue: 0.478, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Средний чек покупателя — 26490 ₽"
        return label
    }()
    
    let attainmentOne: AttainmentView = {
        let at = AttainmentView()
        at.translatesAutoresizingMaskIntoConstraints = false
        return at
    }()
    
    let attainmentSecond: AttainmentView = {
        let at = AttainmentView()
        at.descLabel.text = "Текущая лига"
        at.textLabel.text = "Серебрянная"
        at.logoImageView.image = UIImage(named: "serb")
        at.translatesAutoresizingMaskIntoConstraints = false
        return at
    }()

    
    let progress: ProgressBar = {
       let ps = ProgressBar()
        ps.translatesAutoresizingMaskIntoConstraints = false
        return ps
    }()

    let settingsTableView: UITableView = {
        let table = UITableView()
        table.register(CatalogCell.self, forCellReuseIdentifier: CatalogCell.id)
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        table.estimatedRowHeight = 48
        table.separatorStyle = .none
        return table
    }()
    
    let notifiView: NotifiView = {
       let notifi = NotifiView()
        notifi.translatesAutoresizingMaskIntoConstraints = false
        return notifi
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
        addSubview(titleLabel)
        addSubview(exitButton)
        addSubview(profileImageView)
        addSubview(helloLabel)
        addSubview(planLabel)
        addSubview(progress)
        addSubview(attainmentOne)
        addSubview(attainmentSecond)
        addSubview(settingsTableView)
        addSubview(notifiView)


        createConstaints()
        backgroundColor = .white
        
    }
    
    func createConstaints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            exitButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            exitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22.25),
            exitButton.heightAnchor.constraint(equalToConstant: 25),
            exitButton.widthAnchor.constraint(equalToConstant: 25),
            
            profileImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 34),
            profileImageView.heightAnchor.constraint(equalToConstant: 128),
            profileImageView.widthAnchor.constraint(equalToConstant: 128),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            helloLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            helloLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            
            planLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 8),
            planLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            progress.topAnchor.constraint(equalTo: planLabel.bottomAnchor, constant: 28),
            progress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            progress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            progress.heightAnchor.constraint(equalToConstant: 62),
            
            attainmentOne.topAnchor.constraint(equalTo: progress.bottomAnchor, constant: 16),
            attainmentOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            attainmentOne.trailingAnchor.constraint(equalTo: attainmentSecond.leadingAnchor, constant: -16),
            
            
            attainmentSecond.topAnchor.constraint(equalTo: progress.bottomAnchor, constant: 16),
            attainmentSecond.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            attainmentSecond.widthAnchor.constraint(equalTo: attainmentOne.widthAnchor),
            
            notifiView.topAnchor.constraint(equalTo: attainmentOne.bottomAnchor, constant: 16),
            notifiView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            notifiView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            
            settingsTableView.topAnchor.constraint(equalTo: notifiView.bottomAnchor, constant: 16),
            settingsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),


            
        ])
        
    }

}
