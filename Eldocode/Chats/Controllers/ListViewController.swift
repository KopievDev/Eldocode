//
//  ListViewController.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 22.06.2021.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.id, for: indexPath) as? MessageCell else {return UITableViewCell()}
        
        cell.widthMessage = self.view.bounds.width * 0.75 - 12
        cell.leftBubble.isActive = false
        cell.rightBubble.isActive = false
        cell.configureCell(message: messageArray[indexPath.row])
        return cell
    }
        
    private lazy var messageTableView: UITableView = {
        let table = UITableView(frame: view.frame, style: .plain)
        table.register(MessageCell.self, forCellReuseIdentifier: MessageCell.id)
        table.dataSource = self
        table.separatorStyle = .none
        table.estimatedRowHeight = 100
        table.remembersLastFocusedIndexPath = true
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        return table
    }()
    var contactName:(String, String)?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(messageTableView)
        guard let name = contactName else {return}
        configureNavigationBar(withTitle: name.0, imageCircle: UIImage(named: name.1)!)

    }

}
