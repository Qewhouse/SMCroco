//
//  GameViewController.swift
//  SMCroco
//
//  Created by Damir Zaripov on 18.04.2023.
//

import UIKit

final class GameViewController: UIViewController {
    
    //MARK: - Delegates
    
    var delegate: CounterDelegate?
    
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
        imageView.contentMode = .scaleToFill
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
        correctButton.addTarget(self, action: #selector(correctButtonPressed), for: .touchUpInside)
        
        let rulesBrokenButton = UIButton()
        rulesBrokenButton.setTitle("Нарушил правила", for: .normal)
        rulesBrokenButton.backgroundColor = Theme.wrongColor
        rulesBrokenButton.tintColor = .white
        rulesBrokenButton.layer.cornerRadius = 10
        rulesBrokenButton.contentHorizontalAlignment = .fill
        rulesBrokenButton.titleLabel?.textAlignment = .center
        rulesBrokenButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        rulesBrokenButton.addTarget(self, action: #selector(rulesBrokenButtonPressed), for: .touchUpInside)
        
        let resetButton = UIButton()
        resetButton.setTitle("Сбросить", for: .normal)
        resetButton.backgroundColor = Theme.neutralColor
        resetButton.tintColor = .white
        resetButton.layer.cornerRadius = 10
        resetButton.contentHorizontalAlignment = .fill
        resetButton.titleLabel?.textAlignment = .center
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        resetButton.addTarget(self, action: #selector(showResetAlert), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [correctButton, rulesBrokenButton, resetButton])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        startCountdownTimer()
        showRandomTask()
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
        
        let vc = CorrectViewController()
        navigationController?.pushViewController(vc, animated: true)
        CounterModel.shared.counter += 1
        delegate?.counterDidUpdate(CounterModel.shared.counter)
    }
    
    @objc private func rulesBrokenButtonPressed() {
        
        let vc = WrongViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showResetAlert() {
        
        let alertController = UIAlertController(title: "Сбросить игру?", message: "Вы хотите сбросить вашу игру и вернуться в главное меню?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Да", style: .destructive) { (action:UIAlertAction!) in
            let vc = MainViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { (action:UIAlertAction!) in}
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
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
    
    private func showRandomTask() {
        let randomCategoryIndex = Int.random(in: 0..<WordList.categories.count)
        let categoryArray = WordList.categories[randomCategoryIndex]
        let randomWordIndex = Int.random(in: 0..<categoryArray.count)
        let randomWord = categoryArray[randomWordIndex]
        
        wordLabelView.text = randomWord
        
        let randomConditionIndex = Int.random(in: 0..<Conditions.conditions.count)
        let randomCondition = Conditions.conditions[randomConditionIndex]

        rulesLabelView.text = randomCondition
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            rectangleCrocoImageView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            rectangleCrocoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            timerLabelView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            timerLabelView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            timerLabelView.bottomAnchor.constraint(equalTo: buttonsStackView.bottomAnchor, constant: -440),
            
            wordLabelView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            wordLabelView.topAnchor.constraint(equalTo: timerLabelView.bottomAnchor, constant: -50),
            
            rulesLabelView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            rulesLabelView.topAnchor.constraint(equalTo: wordLabelView.bottomAnchor, constant: -5),
            
            buttonsStackView.topAnchor.constraint(equalTo: timerLabelView.topAnchor, constant: 500),
            buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
}
