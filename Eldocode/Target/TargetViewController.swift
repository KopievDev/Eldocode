//
//  TargetViewController.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 19.06.2021.
//

import UIKit

class TargetViewController: UIViewController, UICollectionViewDataSource {
    
    init() {
          super.init(nibName: nil, bundle: nil)
          tabBarItem = UITabBarItem(title: "Цели", image: #imageLiteral(resourceName: "star"), tag: 0)
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goodsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotGoodsCell.id, for: indexPath) as? HotGoodsCell else { return UICollectionViewCell()}
        let good = goodsArray[indexPath.row]
        cell.configure(with: good)
        
        return cell
        
    }
    
    let educationDataSource = EducationDataSource()
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
    
    lazy var hotGoodsCollection: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 290, height: 140)
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        collection.register(HotGoodsCell.self, forCellWithReuseIdentifier: HotGoodsCell.id)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    let educationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Обучение и развитие"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let educationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var educationCollection: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 290, height: 140)
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.dataSource = educationDataSource
        collection.showsHorizontalScrollIndicator = false
        collection.register(EducationCell.self, forCellWithReuseIdentifier: EducationCell.id)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    let progress = ProgressBar()
    let salesView = SalesProgramView()
    let clienButton = EducationCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
 
    
    func setUp() {
        view.backgroundColor = .white
        
        view.addSubview(progress)
        view.addSubview(salesView)
        view.addSubview(titleLabel)
        view.addSubview(hotGoodsLabel)
        view.addSubview(hotGoodsButton)
        view.addSubview(hotGoodsCollection)
        view.addSubview(educationLabel)
        view.addSubview(educationButton)
        view.addSubview(educationCollection)
        
        progress.translatesAutoresizingMaskIntoConstraints = false
        salesView.translatesAutoresizingMaskIntoConstraints = false
        clienButton.translatesAutoresizingMaskIntoConstraints = false
        createConstaraints()
    }
    
    
    func createConstaraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: progress.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: progress.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            
            progress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            progress.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            progress.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 40),
            progress.heightAnchor.constraint(equalToConstant: 62),
            
            salesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            salesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            salesView.topAnchor.constraint(equalTo: progress.bottomAnchor, constant: 16),
            
            hotGoodsLabel.topAnchor.constraint(equalTo: salesView.bottomAnchor, constant: 16),
            hotGoodsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            hotGoodsLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            hotGoodsButton.centerYAnchor.constraint(equalTo: hotGoodsLabel.centerYAnchor),
            hotGoodsButton.heightAnchor.constraint(equalToConstant: 10),
            hotGoodsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27),
            
            hotGoodsCollection.topAnchor.constraint(equalTo: hotGoodsButton.bottomAnchor, constant: 16),
            hotGoodsCollection.heightAnchor.constraint(equalToConstant: 140),
            hotGoodsCollection.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            educationLabel.topAnchor.constraint(equalTo: hotGoodsCollection.bottomAnchor, constant: 16),
            educationLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            educationLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            educationButton.centerYAnchor.constraint(equalTo: educationLabel.centerYAnchor),
            educationButton.heightAnchor.constraint(equalToConstant: 10),
            educationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27),
            
            educationCollection.topAnchor.constraint(equalTo: educationButton.bottomAnchor, constant: 8),
            educationCollection.heightAnchor.constraint(equalToConstant: 140),
            educationCollection.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            
        ])
    }
}
