//
//  GameResultsViewController.swift
//  SMCroco
//
//  Created by Alexander Altman on 18.04.2023.
//

import UIKit

class GameResultViewController: UIViewController {
    
    //MARK: -Elements
    
    private let mainView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "BackgroundWithoutGrass")
        return view
    }()
    
//    private let layoutTeamsCollectionView: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 28
//        return layout
//    }()
//    
//    private lazy var teamsCollectionView: UICollectionView = {
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layoutTeamsCollectionView)
//        cv.backgroundColor = .clear
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        cv.register(TeamsCollectionViewCell.self, forCellWithReuseIdentifier: TeamsCollectionViewCell.identifier)
//        cv.dataSource = self
//        cv.delegate = self
//        return cv
//    }()
    
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
//        view.addSubview(categoryCV)
        view.addSubview(startOverButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate(
            [mainView.topAnchor.constraint(equalTo: view.topAnchor),
             mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             
//             categoryCV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 96),
//             categoryCV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
//             categoryCV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//             categoryCV.bottomAnchor.constraint(equalTo: startGameButton.topAnchor, constant: -10),
//             
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
