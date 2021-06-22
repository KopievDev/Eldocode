//
//  CustomInputView.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 22.06.2021.
//

import UIKit

class CustomInputAccesoryView: UIView {
    
    // MARK: - Properties
    
    public let messageInputTextView: UITextView = {
       let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        textView.layer.borderWidth = 0.6
        textView.layer.borderColor = UIColor(red: 0.824, green: 0.824, blue: 0.824, alpha: 1).cgColor
        textView.layer.cornerRadius = 15
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    public let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "send"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 30 / 2
        button.backgroundColor = UIColor(red: 0.824, green: 0.824, blue: 0.824, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let placeholderLabel: UILabel = {
       let label = UILabel()
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cообщение..."
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var heightText = self.messageInputTextView.heightAnchor.constraint(equalToConstant: 100)

    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createDesign()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createDesign()
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return textViewContentSize()
    }
    
    // MARK: - Helpers
    
    fileprivate func createDesign() {
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 10
        layer.shadowOffset = .init(width: 0, height: -2)
        layer.shadowColor = UIColor(red: 0.208, green: 0.722, blue: 0.314, alpha: 1).cgColor
        
        backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        autoresizingMask = .flexibleHeight
        addSubview(messageInputTextView)
        addSubview(sendButton)
        addSubview(placeholderLabel)
        createConstraints()
    }
    
    fileprivate func createConstraints() {
        
        NSLayoutConstraint.activate([
            // Button
            sendButton.centerYAnchor.constraint(equalTo: messageInputTextView.centerYAnchor),
            
            sendButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            sendButton.widthAnchor.constraint(equalToConstant: 30),
            sendButton.heightAnchor.constraint(equalToConstant: 30),
            // TextView
            messageInputTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            messageInputTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            messageInputTextView.trailingAnchor.constraint(equalTo: self.sendButton.leadingAnchor, constant: -10),
            messageInputTextView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            // Placeholder
            placeholderLabel.leadingAnchor.constraint(equalTo: messageInputTextView.leadingAnchor, constant: 13),
            placeholderLabel.centerYAnchor.constraint(equalTo: messageInputTextView.centerYAnchor)
            
        ])
    }
    
    func textViewContentSize() -> CGSize {
        let size = CGSize(width: messageInputTextView.bounds.width,
                          height: CGFloat.greatestFiniteMagnitude)
     
        let textSize = messageInputTextView.sizeThatFits(size)
        return CGSize(width: bounds.width, height: textSize.height)
    }
    
    // MARK: - Selectors
    
//    @objc func sendMessage() {
//        messageArray.append(Message(toMe: false, text: messageInputTextView.text))
//
//    }
    
}
