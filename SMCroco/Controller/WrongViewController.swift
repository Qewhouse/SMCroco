//
//  WrongViewController.swift
//  SMCroco
//
//  Created by Damir Zaripov on 17.04.2023.
//

import UIKit

final class WrongViewController: UIViewController {
    
    //MARK: - Elements
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BlankBackground")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let teamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "TeamImage")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.zPosition = 1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let whiteCellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let redRectangleView: UIView = {
        let view = UIView()
        view.backgroundColor = Theme.wrongColor
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let teamNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ковбои"
        label.textAlignment = .center
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let totalScoreNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 65)
        label.layer.zPosition = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let totalScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Очки"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let failureLabel: UILabel = {
        let label = UILabel()
        label.text = "УВЫ И АХ!"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 28.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scoreNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.layer.zPosition = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let receiveLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы не отгадали слово и не получаете очков!"
        label.font = label.font.withSize(16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nextTurnLabel: UILabel = {
        let label = UILabel()
        label.text = "Следующий ход - 'Стройняшки'"
        label.font = label.font.withSize(16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ellipseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Ellipse")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var changeTurnButton: UIButton = {
        let button = UIButton()
        button.setTitle("Передать ход", for: .normal)
        button.backgroundColor = Theme.appColor
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(changeTurnButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraints()
        totalScoreNumberLabel.text = "\(CounterModel.shared.counter)"
    }
    
    //MARK: - Private Methods
    private func setLayout() {
        view.addSubview(backgroundImageView)
        view.addSubview(teamImageView)
        view.addSubview(whiteCellView)
        view.addSubview(totalScoreNumberLabel)
        view.addSubview(totalScoreLabel)
        view.addSubview(redRectangleView)
        view.addSubview(teamNameLabel)
        view.addSubview(failureLabel)
        view.addSubview(receiveLabel)
        view.addSubview(scoreNumberLabel)
        view.addSubview(nextTurnLabel)
        view.addSubview(ellipseImageView)
        view.addSubview(changeTurnButton)
        
    }
    
    @objc private func changeTurnButtonPressed() {
        let vc = TeamsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    //MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            teamImageView.heightAnchor.constraint(equalToConstant: 56),
            teamImageView.widthAnchor.constraint(equalToConstant: 56),
            teamImageView.topAnchor.constraint(equalTo: whiteCellView.topAnchor, constant: 20),
            teamImageView.leadingAnchor.constraint(equalTo: whiteCellView.leadingAnchor, constant: 50),
            teamImageView.trailingAnchor.constraint(equalTo: whiteCellView.trailingAnchor, constant: -350),
            teamImageView.bottomAnchor.constraint(equalTo: whiteCellView.bottomAnchor, constant: -20),
            teamImageView.centerXAnchor.constraint(equalTo: whiteCellView.centerXAnchor),
            
            teamNameLabel.heightAnchor.constraint(equalToConstant: 22),
            teamNameLabel.widthAnchor.constraint(equalToConstant: 71),
            teamNameLabel.centerYAnchor.constraint(equalTo: whiteCellView.centerYAnchor),
            teamNameLabel.centerXAnchor.constraint(equalTo: whiteCellView.centerXAnchor),
            teamNameLabel.topAnchor.constraint(equalTo: whiteCellView.topAnchor, constant: 37),
            teamNameLabel.bottomAnchor.constraint(equalTo: whiteCellView.bottomAnchor, constant: -37),
            teamNameLabel.leadingAnchor.constraint(equalTo: whiteCellView.leadingAnchor, constant: 105),
            teamNameLabel.trailingAnchor.constraint(equalTo: whiteCellView.trailingAnchor, constant: -175),
            
            totalScoreNumberLabel.heightAnchor.constraint(equalToConstant: 46),
            totalScoreNumberLabel.widthAnchor.constraint(equalToConstant: 57),
            totalScoreNumberLabel.centerYAnchor.constraint(equalTo: whiteCellView.centerYAnchor),
            totalScoreNumberLabel.centerXAnchor.constraint(equalTo: whiteCellView.centerXAnchor),
            totalScoreNumberLabel.topAnchor.constraint(equalTo: whiteCellView.topAnchor, constant: 10),
            totalScoreNumberLabel.bottomAnchor.constraint(equalTo: whiteCellView.bottomAnchor, constant: -20),
            totalScoreNumberLabel.leadingAnchor.constraint(equalTo: whiteCellView.leadingAnchor, constant: 290),
            totalScoreNumberLabel.trailingAnchor.constraint(equalTo: whiteCellView.trailingAnchor, constant: -4),
            
            totalScoreLabel.heightAnchor.constraint(equalToConstant: 22),
            totalScoreLabel.widthAnchor.constraint(equalToConstant: 38),
            totalScoreLabel.centerYAnchor.constraint(equalTo: whiteCellView.centerYAnchor),
            totalScoreLabel.centerXAnchor.constraint(equalTo: whiteCellView.centerXAnchor),
            totalScoreLabel.topAnchor.constraint(equalTo: whiteCellView.topAnchor, constant: 66),
            totalScoreLabel.bottomAnchor.constraint(equalTo: whiteCellView.bottomAnchor, constant: -8),
            totalScoreLabel.leadingAnchor.constraint(equalTo: whiteCellView.leadingAnchor, constant: 297),
            totalScoreLabel.trailingAnchor.constraint(equalTo: whiteCellView.trailingAnchor, constant: -10),
            
            
            changeTurnButton.heightAnchor.constraint(equalToConstant: 60),
            changeTurnButton.widthAnchor.constraint(equalToConstant: 351),
            changeTurnButton.topAnchor.constraint(equalTo: redRectangleView.bottomAnchor, constant: 144),
            changeTurnButton.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -46),
            changeTurnButton.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 12),
            changeTurnButton.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -12),
            changeTurnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            whiteCellView.heightAnchor.constraint(equalToConstant: 96),
            whiteCellView.widthAnchor.constraint(equalToConstant: 351),
            whiteCellView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            whiteCellView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 50),
            whiteCellView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -750),
            whiteCellView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 12),
            whiteCellView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -12),
            whiteCellView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            redRectangleView.heightAnchor.constraint(equalToConstant: 301),
            redRectangleView.widthAnchor.constraint(equalToConstant: 351),
            redRectangleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            redRectangleView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 266),
            redRectangleView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -250),
            redRectangleView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 12),
            redRectangleView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -12),
            redRectangleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            failureLabel.heightAnchor.constraint(equalToConstant: 22),
            failureLabel.widthAnchor.constraint(equalToConstant: 203),
            failureLabel.centerYAnchor.constraint(equalTo: redRectangleView.centerYAnchor),
            failureLabel.centerXAnchor.constraint(equalTo: redRectangleView.centerXAnchor),
            failureLabel.topAnchor.constraint(equalTo: redRectangleView.topAnchor, constant: 10),
            failureLabel.bottomAnchor.constraint(equalTo: redRectangleView.bottomAnchor, constant: -350),
            failureLabel.leadingAnchor.constraint(equalTo: redRectangleView.leadingAnchor, constant: 82),
            failureLabel.trailingAnchor.constraint(equalTo: redRectangleView.trailingAnchor, constant: -66),
            
            receiveLabel.heightAnchor.constraint(equalToConstant: 22),
            receiveLabel.widthAnchor.constraint(equalToConstant: 301),
            receiveLabel.centerYAnchor.constraint(equalTo: redRectangleView.centerYAnchor),
            receiveLabel.centerXAnchor.constraint(equalTo: redRectangleView.centerXAnchor),
            receiveLabel.topAnchor.constraint(equalTo: failureLabel.topAnchor, constant: 50),
            receiveLabel.bottomAnchor.constraint(equalTo: ellipseImageView.topAnchor, constant: -3.48),
            receiveLabel.leadingAnchor.constraint(equalTo: redRectangleView.leadingAnchor, constant: 28.57),
            receiveLabel.trailingAnchor.constraint(equalTo: redRectangleView.trailingAnchor, constant: -21.43),
            
            scoreNumberLabel.heightAnchor.constraint(equalToConstant: 58.16),
            scoreNumberLabel.widthAnchor.constraint(equalToConstant: 58.16),
            scoreNumberLabel.centerYAnchor.constraint(equalTo: ellipseImageView.centerYAnchor),
            scoreNumberLabel.centerXAnchor.constraint(equalTo: ellipseImageView.centerXAnchor),
            
            nextTurnLabel.heightAnchor.constraint(equalToConstant: 22),
            nextTurnLabel.widthAnchor.constraint(equalToConstant: 301),
            nextTurnLabel.centerYAnchor.constraint(equalTo: redRectangleView.centerYAnchor),
            nextTurnLabel.centerXAnchor.constraint(equalTo: redRectangleView.centerXAnchor),
            nextTurnLabel.topAnchor.constraint(equalTo: ellipseImageView.topAnchor, constant: 200),
            nextTurnLabel.bottomAnchor.constraint(equalTo: redRectangleView.bottomAnchor, constant: -10),
            nextTurnLabel.leadingAnchor.constraint(equalTo: redRectangleView.leadingAnchor, constant: 31.63),
            nextTurnLabel.trailingAnchor.constraint(equalTo: redRectangleView.trailingAnchor, constant: -18.37),
            
            
            ellipseImageView.heightAnchor.constraint(equalToConstant: 98.04),
            ellipseImageView.widthAnchor.constraint(equalToConstant: 110.09),
            ellipseImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ellipseImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ellipseImageView.topAnchor.constraint(equalTo: redRectangleView.topAnchor, constant: 114.48),
            ellipseImageView.bottomAnchor.constraint(equalTo: redRectangleView.bottomAnchor, constant: -88.48),
            ellipseImageView.leadingAnchor.constraint(equalTo: redRectangleView.leadingAnchor, constant: 128.82),
            ellipseImageView.trailingAnchor.constraint(equalTo: redRectangleView.trailingAnchor, constant: -112.09),
            
        ])
    }
}
