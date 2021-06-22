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
    
    private lazy var  customInputView: CustomInputAccesoryView = {
            let iv = CustomInputAccesoryView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50 ))
            return iv
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(messageTableView)
        guard let name = contactName else {return}
        configureNavigationBar(withTitle: name.0, imageCircle: UIImage(named: name.1)!)
        customInputView.sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        customInputView.messageInputTextView.delegate = self
    }
    
    override var canBecomeFirstResponder: Bool {
               return true
           }
        override var canResignFirstResponder: Bool {
                return true
        }
        
        override var inputAccessoryView: UIView? {
            return customInputView
        }
    
    @objc func sendMessage() {
        guard let content = self.customInputView.messageInputTextView.text,
              content.filter({ $0 != " " && $0 != "\n"}).count > 0 else {
            print("empty")
            return
        }
        messageArray.append(Message(toMe: false, text: content))
        customInputView.messageInputTextView.text = ""
        customInputView.heightText.constant = customInputView.textViewContentSize().height

        messageTableView.reloadData()
    }
}

// MARK: - Extension TextView
extension ListViewController: UITextViewDelegate {
        
    func textViewDidChange(_ textView: UITextView) {
        UIView.animate(withDuration: 0.1) {
            self.customInputView.placeholderLabel.isHidden = !self.customInputView.messageInputTextView.isEmpty()
        }

        if customInputView.textViewContentSize().height >= 100 {
            customInputView.messageInputTextView.isScrollEnabled = true
            customInputView.heightText.isActive = true
        } else {
            
            customInputView.messageInputTextView.isScrollEnabled = false
            customInputView.heightText.constant = customInputView.textViewContentSize().height

        }
    }
        
}
