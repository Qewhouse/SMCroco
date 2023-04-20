//
//  TeamsViewController.swift
//  SMCroco
//
//  Created by Alexander Altman on 18.04.2023.
//

import UIKit

final class TeamsViewController: UIViewController {
    
    let teamsCollectionViewCell = TeamsCollectionViewCell()
    var teams = Teams()
    
    //MARK: -Elements
    
    private let mainView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "BackgroundWithoutGrass")
        return view
    }()
    
    private let layoutTeamsCollectionView: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 28
        return layout
    }()
    
    private lazy var teamsCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layoutTeamsCollectionView)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TeamsCollectionViewCell.self, forCellWithReuseIdentifier: TeamsCollectionViewCell.identifier)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    lazy var readyButton: UIButton = {
       let button = UIButton()
        button.setTitle("Игроки готовы", for: .normal)
        button.backgroundColor = Theme.appColor
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "Bhavuka", size: 20)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(goToCategory), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Кто играет?"
        navigationItem.backBarButtonItem?.isEnabled = true
        view.addSubview(mainView)
        view.addSubview(teamsCollectionView)
        view.addSubview(readyButton)
        setConstraints()
    }
    
    //MARK: -Private Methods
    
    @objc private func goToCategory() {
        print("Start")
        let vc = CategoryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate(
            [mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             
             teamsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
             teamsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
             teamsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
             teamsCollectionView.bottomAnchor.constraint(equalTo: readyButton.topAnchor, constant: -10),
            
             readyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             readyButton.heightAnchor.constraint(equalToConstant: 63),
             readyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
             readyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
             readyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -62),
            ])
    }
}


extension TeamsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.randomTeams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamsCollectionViewCell.identifier, for: indexPath) as! TeamsCollectionViewCell;
            cell.teamName.text = teams.randomTeams[indexPath.row]
            cell.teamIcon.image = UIImage(named: cell.teamName.text!)
            cell.clipsToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: (collectionView.frame.height / 8))
    }
    
}
