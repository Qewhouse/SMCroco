//
//  RulesViewController.swift
//  SMCroco
//
//  Created by Edward Kheladze on 18.04.2023.
//

import UIKit

class RulesViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let backButton = UIButton(type: .system)
    private let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupBackButton()
        setupLabel()
    }
    
    private func setupScrollView() {
        scrollView.frame = view.bounds
        scrollView.backgroundColor = .green
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsVerticalScrollIndicator = true
        view.addSubview(scrollView)
    }
    
    private func setupBackButton() {
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupLabel() {
        label.text = "В игру играют командами из двух или более человек. Задача каждого игрока команды - объяснить слово, которое он видит на экране, следуя условиям, которые дополнительно указаны под загаданным словом. Чем больше слов отгадала команда, тем больше она заработает баллов. Выигрывает команда, набравшая больше всего баллов. На отгадывание слова дается одна минута. При нарушении правил объяснения слова, ход передается следующей команде."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 34)
        label.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 0)
        label.sizeToFit()
        scrollView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            label.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            label.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

