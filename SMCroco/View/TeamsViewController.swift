//
//  TeamsViewController.swift
//  SMCroco
//
//  Created by Alexander Altman on 18.04.2023.
//

import UIKit

final class TeamsViewController: UIViewController {
    
    lazy var readyButton: UIButton = {
       let button = UIButton()
        button.setTitle("Игроки готовы", for: .normal)
        button.backgroundColor = Theme.appColor
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(goToCategory), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        title = "Кто играет?"
        navigationItem.backBarButtonItem?.isEnabled = true
        view.addSubview(readyButton)
        setConstraints()
    }
    
    @objc private func goToCategory() {
        print("Start")
        let vc = CategoryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension TeamsViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            readyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            readyButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            readyButton.heightAnchor.constraint(equalToConstant: 80),
            readyButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
