//
//  EducationDataSource.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 19.06.2021.
//

import UIKit

class EducationDataSource:NSObject, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomButton.id, for: indexPath) as? CustomButton else { return UICollectionViewCell()}
        if indexPath.row == 1 {
            cell.logoImageView.image = UIImage(named: "rating")
            cell.textLabel.text = "Как повысить\nсредний чек\nпокупателя"
        }
        if indexPath.row == 2 {
            cell.logoImageView.image = UIImage(named: "rating")
            cell.textLabel.text = "Улучши\nобщение\nс клиентами"
        }

        
        return cell
    }
    
 
    
    
}
