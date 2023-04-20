//
//  GameResultCVCell.swift
//  SMCroco
//
//  Created by Лариса Терегулова on 20.04.2023.
//

import UIKit

class GameResultCVCell: UICollectionViewCell {
    static let identifier = "GameResultCVCell"
    
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
    
    private let totalScoreNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.layer.zPosition = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let totalScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Очки"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Bhavuka", size: 15)
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
        self.contentView.addSubview(totalScoreLabel)
        self.contentView.addSubview(totalScoreNumberLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            teamIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  17),
            teamIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamIcon.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.16),
            teamIcon.heightAnchor.constraint(equalTo: teamIcon.widthAnchor),
            
            totalScoreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            totalScoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            totalScoreNumberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            totalScoreNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -19),
            
            
                                     
            teamName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamName.leadingAnchor.constraint(equalTo: teamIcon.trailingAnchor, constant: 56),
            teamName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
