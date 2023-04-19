//
//  CategoryCollectionViewCell.swift
//  SMCroco
//
//  Created by Лариса Терегулова on 19.04.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCVCell"
    let category = Category()
    var flag = 0
    var indexCategory = 0
    
    //MARK: - Elements
    
    let categoryIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let categoryName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Bhavuka", size: 20)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     lazy var markImageView: UIImageView = {
         let iv = UIImageView()
         iv.image = category.mark
         iv.backgroundColor = .clear
         iv.tintColor = .white
         iv.isHidden = true
         iv.translatesAutoresizingMaskIntoConstraints = false
         return iv
    }()
    
    //MARK: -Life Cicle
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(choiceCategory)))
        addElemets()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func addElemets() {
        self.contentView.addSubview(categoryIcon)
        self.contentView.addSubview(categoryName)
        self.contentView.addSubview(markImageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            categoryIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  17),
            categoryIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            categoryIcon.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.15),
            categoryIcon.heightAnchor.constraint(equalTo: categoryIcon.widthAnchor),
                                     
            categoryName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            categoryName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            markImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            markImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            markImageView.widthAnchor.constraint(equalToConstant: 30),
            markImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func choiceCategory() {
            if flag == 0 {
                markImageView.isHidden = false
                flag = 1
            } else {
                markImageView.isHidden = true
                flag = 0
            }
        }
}
