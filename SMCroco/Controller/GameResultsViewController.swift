//
//  GameResultsViewController.swift
//  SMCroco
//
//  Created by Alexander Altman on 18.04.2023.
//

import UIKit

class GameResultViewController: UIViewController {
    var teams = Teams()
    let gameResultCVCell = GameResultCVCell()
    let teamsCollectionViewCell = TeamsCollectionViewCell()
    
    //MARK: -Elements
    
    private let mainView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "BackgroundWithoutGrass")
        return view
    }()
    
    private let layoutGameResultCV: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 28
        return layout
    }()
    
    private lazy var gameResultCV: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layoutGameResultCV)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(GameResultCVCell.self, forCellWithReuseIdentifier: GameResultCVCell.identifier)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    lazy var startOverButton: UIButton = {
       let button = UIButton()
        button.setTitle("Начать сначала", for: .normal)
        button.backgroundColor = Theme.appColor
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "Bhavuka", size: 20)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(goToStart), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: -Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Результаты"
        addElements()
        setConstraints()
    }
    
    //MARK: -Methods
    
    func addElements() {
        view.addSubview(mainView)
        view.addSubview(gameResultCV)
        view.addSubview(startOverButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate(
            [mainView.topAnchor.constraint(equalTo: view.topAnchor),
             mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             
             gameResultCV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 96),
             gameResultCV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
             gameResultCV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
             gameResultCV.bottomAnchor.constraint(equalTo: startOverButton.topAnchor, constant: -10),
             
            startOverButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startOverButton.heightAnchor.constraint(equalToConstant: 63),
            startOverButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            startOverButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            startOverButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -62)
            ])
    }
    
    @objc func goToStart() {
        print("Go to teams view")
        let vc = TeamsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension GameResultViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    //MARK: -UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.randomTeams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameResultCVCell.identifier, for: indexPath) as! GameResultCVCell;
//        cell.teamName.text = teamsCollectionViewCell.teamName.text
//        cell.teamIcon.image = teamsCollectionViewCell.teamIcon.image
        cell.teamName.text = teams.randomTeams[indexPath.row]
        cell.teamIcon.image = UIImage(named: cell.teamName.text!)
            cell.clipsToBounds = true
        
        return cell
    }
    
    //MARK: -UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: (collectionView.frame.height / 8))
    }
    
}
