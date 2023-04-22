//
//  TeamsCollectionViewCell.swift
//  SMCroco
//
//  Created by Лариса Терегулова on 18.04.2023.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TeamsCollectionViewCell"
    
    //MARK: = Elements
    
    let teamIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let teamName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Bhavuka", size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: -Life Cicle
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        addElemets()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func addElemets() {
        self.contentView.addSubview(teamIcon)
        self.contentView.addSubview(teamName)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            teamIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  17),
            teamIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamIcon.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.16),
            teamIcon.heightAnchor.constraint(equalTo: teamIcon.widthAnchor),
                                     
            teamName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamName.leadingAnchor.constraint(equalTo: teamIcon.trailingAnchor, constant: 56),
            teamName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
