//
//  MainViewController.swift
//  SMCroco
//
//  Created by Alexander Altman on 17.04.2023.
//

import UIKit

final class MainViewController: UIViewController {

    //MARK: - Elements
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let crocoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Croco")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var startButton: UIButton = {
       let button = UIButton()
        button.setTitle("Старт игры", for: .normal)
        button.backgroundColor = Theme.appColor
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = Theme.accentColor.cgColor
        button.addTarget(self, action: #selector(goToTeams), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var rulesButton: UIButton = {
       let button = UIButton()
        button.setTitle("Правила", for: .normal)
        button.backgroundColor = Theme.appColor
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(goToRules), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
  //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraints()
    }
    
    //MARK: - Private Methods
    private func setLayout() {
        view.addSubview(backgroundImageView)
        view.addSubview(crocoImageView)
        view.addSubview(startButton)
        view.addSubview(rulesButton)
    }
    
    @objc private func goToTeams() {
        print("Start")
        let vc = TeamsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func goToRules() {
        print("Rules")
        let vc = RulesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - Constraints
extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            crocoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 172),
            crocoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            crocoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            crocoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            crocoImageView.heightAnchor.constraint(equalToConstant: 322),
            crocoImageView.widthAnchor.constraint(equalToConstant: 268),
            
            startButton.heightAnchor.constraint(equalToConstant: 83),
            startButton.widthAnchor.constraint(equalToConstant: 274),
            startButton.topAnchor.constraint(equalTo: crocoImageView.bottomAnchor, constant: 100),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            rulesButton.heightAnchor.constraint(equalToConstant: 63),
            rulesButton.widthAnchor.constraint(equalToConstant: 211),
            rulesButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 39),
            rulesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
}

import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 12 Pro Max")
            .previewDisplayName("iPhone 12 Pro Max")
        
        ContainterView().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone SE (3rd generation)")
            .previewDisplayName("iPhone SE (3rd generation)")
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        let listVC = MainViewController()
        func makeUIViewController(context:
                                  UIViewControllerRepresentableContext<ListProvider.ContainterView>) -> MainViewController {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController:
                                    ListProvider.ContainterView.UIViewControllerType, context:
                                    UIViewControllerRepresentableContext<ListProvider.ContainterView>) {
        }
    }
}
