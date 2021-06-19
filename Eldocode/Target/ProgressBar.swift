//
//  ProgressBar.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 19.06.2021.
//

import UIKit

class ProgressBar: UIView {


    let planLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Выполнение плана на июнь"
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Продано на 86 990 из 170 000 ₽"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let progressBar: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.progressTintColor = UIColor(red: 0.467, green: 0.749, blue: 0.263, alpha: 1)
        progress.backgroundColor = UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)
        progress.layer.cornerRadius = 6
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progress = 0.5
        progress.clipsToBounds = true
        return progress
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
        addSubview(progressBar)
        addSubview(descLabel)
        addSubview(planLabel)
        createConstaints()
        for view: UIView in progressBar.subviews {
            if view is UIImageView {
                view.clipsToBounds = true
                view.layer.cornerRadius = 6
            }
        }

        
    }
    
    func createConstaints() {
        NSLayoutConstraint.activate([
            planLabel.topAnchor.constraint(equalTo: topAnchor),
            planLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            planLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            planLabel.heightAnchor.constraint(equalToConstant: 22),
            
            progressBar.topAnchor.constraint(equalTo: planLabel.bottomAnchor, constant: 8),
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            progressBar.heightAnchor.constraint(equalToConstant: 10),
            
            descLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 8),
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
    }
}
