//
//  ChatsViewController.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit

class ChatsViewController: UIViewController {
   
    
    let chatsTableView: UITableView = {
        let table = UITableView()
        table.register(ChatCell.self, forCellReuseIdentifier: ChatCell.id)
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

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
        textfield.attributedPlaceholder = NSAttributedString(string: "Поиск по имени", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.475, green: 0.475, blue: 0.478, alpha: 1)])
        return textfield
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Чаты"
        return label
    }()

    
    init() {
          super.init(nibName: nil, bundle: nil)
          tabBarItem = UITabBarItem(title: "Чат", image: #imageLiteral(resourceName: "chat"), tag: 3)
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        view.backgroundColor = .white
        view.addSubview(searchTextfield)
        view.addSubview(chatsTableView)
        view.addSubview(titleLabel)
        
        chatsTableView.dataSource = self
        createConstraints()

    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            searchTextfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchTextfield.heightAnchor.constraint(equalToConstant: 40),
            
            
            titleLabel.topAnchor.constraint(equalTo: searchTextfield.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            chatsTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            chatsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}
// MARK: - DataSource
extension ChatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatCell.id, for: indexPath) as? ChatCell else { return UITableViewCell()}
        
        let chat = chatArray[indexPath.row]
        cell.configureWith(chat: chat)
        return cell
    }
    
}
