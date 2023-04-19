//
//  GameViewController.swift
//  SMCroco
//
//  Created by Damir Zaripov on 18.04.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    //MARK: - Variables
    private var countdownTimer: Timer?
    private var remainingSeconds = 59
    
    //MARK: - Elements
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BlankBackground")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let rectangleCrocoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "RectangleCroco")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let timerLabelView: UILabel = {
        let labelView = UILabel()
        labelView.text = "00:59"
        labelView.font = labelView.font.withSize(48)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    private let wordLabelView: UILabel = {
        let labelView = UILabel()
        labelView.text = "Картошка"
        labelView.font = labelView.font.withSize(48)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    private let rulesLabelView: UILabel = {
        let labelView = UILabel()
        labelView.text = "объясни с помощью жестов"
        labelView.font = labelView.font.withSize(20)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    private let buttonsStackView: UIStackView = {
        
        let correctButton = UIButton()
        correctButton.setTitle("Правильно", for: .normal)
        correctButton.backgroundColor = Theme.appColor
        correctButton.tintColor = .white
        correctButton.layer.cornerRadius = 10
        correctButton.contentHorizontalAlignment = .fill
        correctButton.titleLabel?.textAlignment = .center
        correctButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        correctButton.addTarget(GameViewController.self, action: #selector(correctButtonPressed), for: .touchUpInside)
        
        let rulesBrokenButton = UIButton()
        rulesBrokenButton.setTitle("Нарушил правила", for: .normal)
        rulesBrokenButton.backgroundColor = Theme.wrongColor
        rulesBrokenButton.tintColor = .white
        rulesBrokenButton.layer.cornerRadius = 10
        rulesBrokenButton.contentHorizontalAlignment = .fill
        rulesBrokenButton.titleLabel?.textAlignment = .center
        rulesBrokenButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        rulesBrokenButton.addTarget(GameViewController.self, action: #selector(rulesBrokenButtonPressed), for: .touchUpInside)
        
        let resetButton = UIButton()
        resetButton.setTitle("Сбросить", for: .normal)
        resetButton.backgroundColor = Theme.neutralColor
        resetButton.tintColor = .white
        resetButton.layer.cornerRadius = 10
        resetButton.contentHorizontalAlignment = .fill
        resetButton.titleLabel?.textAlignment = .center
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        resetButton.addTarget(GameViewController.self, action: #selector(resetButtonPressed), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [correctButton, rulesBrokenButton, resetButton])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraints()
        startCountdownTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopCountdownTimer()
    }
    
    //MARK: - Private Methods
    private func setLayout() {
        view.addSubview(backgroundImageView)
        view.addSubview(rectangleCrocoImageView)
        view.addSubview(timerLabelView)
        view.addSubview(wordLabelView)
        view.addSubview(rulesLabelView)
        view.addSubview(buttonsStackView)
        
    }
    
    @objc private func correctButtonPressed() {
        
        print("correctButtonPressed")
    }
    
    @objc private func rulesBrokenButtonPressed() {
        
        print("rulesBrokenButtonPressed")
    }
    
    @objc private func resetButtonPressed() {
        
        print("resetButtonPressed")
    }
    
    private func startCountdownTimer() {
        countdownTimer?.invalidate()
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in guard let self = self else { return }
            
            self.remainingSeconds -= 1
            
            let minutes = self.remainingSeconds / 60
            let seconds = self.remainingSeconds % 60
            self.timerLabelView.text = String(format: "%02d:%02d", minutes, seconds)
            
            if self.remainingSeconds == 0 {
                self.stopCountdownTimer()
            }
        }
    }
    
    private func stopCountdownTimer() {
        countdownTimer?.invalidate()
        countdownTimer = nil
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            rectangleCrocoImageView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            rectangleCrocoImageView.centerYAnchor.constraint(equalTo:view.centerYAnchor),
            rectangleCrocoImageView.topAnchor.constraint(equalTo: view.topAnchor),
            rectangleCrocoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 116),
            rectangleCrocoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),
            rectangleCrocoImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -642),
            
            timerLabelView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            timerLabelView.centerYAnchor.constraint(equalTo:view.centerYAnchor),
            timerLabelView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            timerLabelView.bottomAnchor.constraint(equalTo: buttonsStackView.bottomAnchor, constant: -440),
            
            wordLabelView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            wordLabelView.topAnchor.constraint(equalTo: timerLabelView.bottomAnchor, constant: -50),
            
            rulesLabelView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            rulesLabelView.topAnchor.constraint(equalTo: wordLabelView.bottomAnchor, constant: -5),
            
            buttonsStackView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            buttonsStackView.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor),
            buttonsStackView.topAnchor.constraint(equalTo: timerLabelView.centerYAnchor, constant: 300),
            buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
}
