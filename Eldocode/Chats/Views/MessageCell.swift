//
//  MessageCell.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 22.06.2021.
//

import UIKit

class MessageCell: UITableViewCell {
    
    // MARK: - Properties
    var widthMessage: CGFloat = 0
    
    static let id = "CellMessage"
    // MARK: - UI
    // TextView
    private let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 16)
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.text = "Test teste test"
        textView.textColor = .black
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    // BubbleView
    let bubbleContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.208, green: 0.722, blue: 0.314, alpha: 1)
        view.layer.cornerRadius = 12
        return view
    }()
    
    // Constrains
    var leftBubble = NSLayoutConstraint()
    var rightBubble = NSLayoutConstraint()
    var widthBubble = NSLayoutConstraint()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - Helpers
    func configureCell(message: Message?) {
        // Обнуление ячейки
        self.backgroundColor = .clear
        textView.textColor = .black
        
        // Ширина сообщения
        widthBubble = bubbleContainer.widthAnchor.constraint(lessThanOrEqualToConstant: widthMessage )
        widthBubble.isActive = true
        // Передача данных
        guard let message = message else {return}
        textView.text = message.text
        if !message.toMe {
            rightBubble.isActive = true
            bubbleContainer.backgroundColor = UIColor(red: 0.208, green: 0.722, blue: 0.314, alpha: 1)
            textView.textColor = .white
        } else {
            leftBubble.isActive = true
            bubbleContainer.backgroundColor = UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)
        }
        
    }
    
    func  createUI() {
        addSubview(bubbleContainer)
        bubbleContainer.addSubview(textView)
        createConstrains()
    }
    
    func createConstrains() {
        
        leftBubble = bubbleContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12)
        rightBubble = bubbleContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12)        
        NSLayoutConstraint.activate([
            // BubbleView
            bubbleContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            bubbleContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            bubbleContainer.widthAnchor.constraint(greaterThanOrEqualTo: self.widthAnchor, multiplier: 0.3),
            

            // TextView
            textView.topAnchor.constraint(equalTo: bubbleContainer.topAnchor, constant: 4),
            textView.leadingAnchor.constraint(equalTo: bubbleContainer.leadingAnchor, constant: 12),
            textView.trailingAnchor.constraint(equalTo: bubbleContainer.trailingAnchor, constant: -12),
            textView.widthAnchor.constraint(greaterThanOrEqualToConstant: widthMessage * 0.3),
            textView.bottomAnchor.constraint(equalTo: bubbleContainer.bottomAnchor, constant: -4)
        ])
        
    }
    
}
