//
//  CategoryViewController.swift
//  SMCroco
//
//  Created by Alexander Altman on 18.04.2023.
//

import UIKit

final class CategoryViewController: UIViewController {
<<<<<<< HEAD
    
    let categoryCVCell = CategoryCollectionViewCell()
    let category = Category()
    var indexCategory = 0
    
    //MARK: -Elements
    
    private let mainView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "BackgroundWithoutGrass")
        return view
    }()
    
    private lazy var startGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Начать игру", for: .normal)
        button.backgroundColor = Theme.appColor
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "Bhavuka", size: 20)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let layoutCategoryCV: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 25
        return layout
    }()
    
    private lazy var categoryCV: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layoutCategoryCV)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        cv.isUserInteractionEnabled = true
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    //MARK: - LifeCycle
    
=======
>>>>>>> RulesViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Категории"
        navigationItem.backBarButtonItem?.isEnabled = true
<<<<<<< HEAD
        addElements()
        setConstraints()
    }
    
    //MARK: -Methods
    
    func addElements() {
        view.addSubview(mainView)
        view.addSubview(categoryCV)
        view.addSubview(startGameButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate(
            [mainView.topAnchor.constraint(equalTo: view.topAnchor),
             mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             
             categoryCV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 96),
             categoryCV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
             categoryCV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
             categoryCV.bottomAnchor.constraint(equalTo: startGameButton.topAnchor, constant: -10),
             
             startGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             startGameButton.heightAnchor.constraint(equalToConstant: 63),
             startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
             startGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
             startGameButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -62)
            ])
    }
    
    @objc func startGame() {
        print("Start")
        let vc = GameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CategoryViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: -UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        category.name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell;
        cell.categoryName.text = category.name[indexPath.row]
        cell.categoryIcon.image = category.image[indexPath.row]
        cell.contentView.backgroundColor = category.color[indexPath.row]
        cell.clipsToBounds = true
        return cell
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: (collectionView.frame.height / 6))
=======
        
        
>>>>>>> RulesViewController
    }
}
