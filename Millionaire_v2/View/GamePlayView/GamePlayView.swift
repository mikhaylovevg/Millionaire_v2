//
//  GamePlayView.swift
//  Millionaire_v2
//
//  Created by Павел Грицков on 10.02.23.
//

import UIKit

class GamePlayView: UIView {
    
    
    // MARK: - Constants
    
    private let spacingMain: CGFloat = 16
    private let offSet: CGFloat = 16
    private let spacingBetweenAnswerButton: CGFloat = 14
    
    
    // MARK: - Canstants and UI
    private let backgroundImageView = UIImageView()
    
    private let stackViewMain = UIStackView()
    
    let timerView = TimerView()
    private let questionLabel = UILabel()

    let containerAnswerButton = AnswersContainerView()
    
    let containerClueView = CluesContainerView()
    
    // MARK: - Internal methods
    
    /// установить вопрос в UILabel
    func configureQiestionLabel(_ text: String) {
        questionLabel.text = text
    }
    
    /// установить значение таймера в UILabel
    func configureTimerLabel(_ timer: Int) {

        // TODO: над будет подумать какой формат принимает
    }
    
    init() {
        super.init(frame: .zero)
        
      setupView()
        
    }
    
    // MARK: - Methods
    
    private func setupView() {

        self.backgroundColor = .white
        
        setupBackgroundImageView()
        
        setupStackViewMain()
        
        setupTimerView()
        setupQuestionLabel()
        
        setupContainerAnswerButtons()
        
        setupContainerClueView()
    }
    
    private func setupBackgroundImageView() {
        backgroundImageView.image = UIImage(named: R.Images.background)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: rightAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupTimerView() {
        stackViewMain.addArrangedSubview(timerView)
    }
    
    private func setupQuestionLabel() {
        questionLabel.text = "Успеет ли команда номер 19 закончить проэкт в срок?"
        questionLabel.font = UIFont.boldSystemFont(ofSize: 30)
        questionLabel.numberOfLines = 0
        questionLabel.textColor = .white
        questionLabel.textAlignment = .center
        
        stackViewMain.addArrangedSubview(questionLabel)
    }
    
    private func setupContainerAnswerButtons() {
        stackViewMain.addArrangedSubview(containerAnswerButton)
    }
    
    private func setupContainerClueView() {
        stackViewMain.addArrangedSubview(containerClueView)
    }
    
    private func setupStackViewMain() {
        stackViewMain.axis = .vertical
        stackViewMain.spacing = spacingMain
        stackViewMain.distribution = .fill
        stackViewMain.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackViewMain)
        
        NSLayoutConstraint.activate([
            stackViewMain.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackViewMain.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: offSet),
            stackViewMain.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -offSet),
            stackViewMain.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -offSet)])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
