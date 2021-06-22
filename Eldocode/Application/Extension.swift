//
//  Extension.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 20.06.2021.
//

import UIKit

extension UITextField {
    func setIcon(_ image: UIImage?) {
        let iconView = UIImageView(frame:
                                    CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
                                                CGRect(x: 20, y: 0, width: 40, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    
    func setRightIcon(_ image: UIImage?) {
        let iconView = UIImageView(frame:
                                    CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        iconView.contentMode = .scaleAspectFit
        let iconContainerView: UIView = UIView(frame:
                                                CGRect(x: 0, y: 0, width: 40, height: 30))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}

extension UIViewController {
     
    func configureNavigationBar(withTitle title: String, image: UIImage?) {
        
        guard let image = image else {return}
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
//        imageView.backgroundColor = .green
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
//        imageView.layer.cornerRadius = 18
//        imageView.clipsToBounds = true

        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.distribution = .equalCentering
        stackView.frame.size = CGSize(width: imageView.frame.width + label.frame.width, height: max(imageView.frame.height, label.frame.height))
        stackView.axis = .horizontal
        stackView.spacing = 5
        
        navigationItem.titleView = stackView
        
    }
    
    func configureNavigationBar(withTitle title: String, imageCircle: UIImage?) {
        
        guard let image = imageCircle else {return}
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
        imageView.layer.cornerRadius = 18
        imageView.clipsToBounds = true

        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.distribution = .equalCentering
        stackView.frame.size = CGSize(width: imageView.frame.width + label.frame.width, height: max(imageView.frame.height, label.frame.height))
        stackView.axis = .horizontal
        stackView.spacing = 5
        
        navigationItem.titleView = stackView
        
    }

   
}
