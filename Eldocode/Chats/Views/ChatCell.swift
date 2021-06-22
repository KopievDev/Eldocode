//
//  ChatCell.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit


class ChatCell: UITableViewCell {
    
    // MARK: - Properties
    static let id = "chatCell"
    // username
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Чат магазина"
        return label
    }()
    
    // Last message
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Ребят, помогите продать кофемашину 😔"
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.475, green: 0.475, blue: 0.478, alpha: 1)
        return label
    }()
    // new message indicator label
    private let newMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "22"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 9)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.backgroundColor = UIColor(red: 0.757, green: 0.008, blue: 0.188, alpha: 1)
        label.layer.cornerRadius = 11
        label.clipsToBounds = true
        return label
    }()
    
    // Image of contacts
    private let contactImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 44 / 2
        iv.contentMode = .center
        iv.backgroundColor = UIColor(red: 0.467, green: 0.749, blue: 0.263, alpha: 1)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "avatar")
        return iv
    }()
        
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func createUI() {
        
        addSubview(contactImageView)
        addSubview(fullNameLabel)
        addSubview(messageLabel)
        addSubview(newMessageLabel)
        createConstrains()
        
    }
    
    func configureWith(chat: ChatModel) {
        self.contactImageView.image = UIImage(named: chat.image)
        self.fullNameLabel.text = chat.name
        self.messageLabel.text = chat.lastMessage
        self.newMessageLabel.text = "\(Int.random(in: 1...10))"
    }
    func createConstrains() {
        
        NSLayoutConstraint.activate([
            contactImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contactImageView.widthAnchor.constraint(equalToConstant: 44),
            contactImageView.heightAnchor.constraint(equalToConstant: 44),
            contactImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            contactImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            fullNameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 8),
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            messageLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13),
            messageLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 1),
            
            newMessageLabel.heightAnchor.constraint(equalToConstant: 22),
            newMessageLabel.widthAnchor.constraint(equalToConstant: 22),
            newMessageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            newMessageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            

        ])
        
    }
}


