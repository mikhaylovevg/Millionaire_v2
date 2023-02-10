//
//  GamePlayView.swift
//  Millionaire_v2
//
//  Created by Павел Грицков on 10.02.23.
//

import UIKit

class GamePlayView: UIView {
    
    
    // MARK: - Constants
    
    private let spacingMain: CGFloat = 24
    private let offSet: CGFloat = 16
    private let spacingBetweenAnswerButton: CGFloat = 14
    
    
    // MARK: - Canstants and UI
    
    private let stackViewMain = UIStackView()
    private let stackViewTop = UIStackView()
    
    let backButton = UIButton()
    private let questionNumberLabel = UILabel()
    let showTableQuestionsButton = UIButton()
    
    private let timerLabel = UILabel()
    private let questionLabel = UILabel()
    
    private let stackViewContainerAnswers = UIStackView()
    var answerButtons: [UIButton] = []
    
    private let stackViewBottom = UIStackView()
    var clueButtons: [UIButton] = []
    
    /// принимает массив ответов и устанавливает на кнопку
    func configureButton(with answers: [String]) {
        answers.enumerated().forEach { index, answer in
            answerButtons[index].setTitle(answer, for: .normal)
        }
    }
    
    // MARK: - Internal methods
    
    /// установить вопрос в UILabel
    func configureQiestionLabel(_ text: String) {
        questionLabel.text = text
    }
    
    func configureQuestionNumberLabel(_ number: Int) {
        questionNumberLabel.text = "QUESTION: \(number)"
    }
    
    /// установить значение таймера в UILabel
    func configureTimerLabel(_ timer: Int) {
        timerLabel.text = "\(timer)"
        
        // TODO: над будет подумать какой формат принимает
    }
    
    init() {
        super.init(frame: .zero)
        
      setupView()
        
    }
    
    
    // MARK: - Methods
    
    private func setupView() {
        // view setting
        self.backgroundColor = .systemBlue
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setupStackViewMain()
        
        setupStackViewTop()
        setupBackButton()
        setupQuestionNumberLabel()
        setupShoeTableQuestionsButton()
        
        setupTimerLabel()
        setupQuestionLabel()
        
        setupAnswerButtons()
        setupStackViewContainerAnswers()
        
        setupClueButtons()
        setupStackViewBottom()
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackViewMain.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackViewMain.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: offSet),
            stackViewMain.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -offSet),
            stackViewMain.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            
        ])
    }
    
    private func setupStackViewTop() {
        stackViewTop.axis = .horizontal
        stackViewTop.distribution = .fillProportionally
        
        stackViewMain.addArrangedSubview(stackViewTop)
    }

    private func setupBackButton() {
        backButton.setImage(UIImage.getImageSymbolForButton(with: 20, and: "arrow.left"), for: .normal)
        backButton.tintColor = .white
        
        stackViewTop.addArrangedSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupQuestionNumberLabel() {
        questionNumberLabel.text = "QUESTION - 1"
        questionNumberLabel.textColor = .white
        questionNumberLabel.font = UIFont.boldSystemFont(ofSize: 18)
        questionNumberLabel.textAlignment = .center
        
        stackViewTop.addArrangedSubview(questionNumberLabel)
        
        // TODO: подумать как сделать лайбл с разным по стилю текстом
    }
    
    private func setupShoeTableQuestionsButton() {
        showTableQuestionsButton.setImage(UIImage.getImageSymbolForButton(with: 20, and: "list.bullet.clipboard"), for: .normal)
        showTableQuestionsButton.tintColor = .white
        
        stackViewTop.addArrangedSubview(showTableQuestionsButton)
        
        NSLayoutConstraint.activate([
            showTableQuestionsButton.heightAnchor.constraint(equalToConstant: 50),
            showTableQuestionsButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupTimerLabel() {
        timerLabel.text = "05"
        timerLabel.font = UIFont.boldSystemFont(ofSize: 30)
        timerLabel.textColor = .red.withAlphaComponent(0.8)
        timerLabel.textAlignment = .center
        timerLabel.backgroundColor = .red.withAlphaComponent(0.3)
        
        stackViewMain.addArrangedSubview(timerLabel)
        
        NSLayoutConstraint.activate([
            timerLabel.heightAnchor.constraint(equalToConstant: 50),
            timerLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        // TODO: нужно делать отдельную вьюшку для этой штуки. Пока тусть так
    }
    
    private func setupQuestionLabel() {
        questionLabel.text = "Успеет ли команда номер 19 закончить проэкт в срок?"
        questionLabel.font = UIFont.boldSystemFont(ofSize: 30)
        questionLabel.numberOfLines = 0
        questionLabel.textColor = .white
        questionLabel.textAlignment = .center
        
        stackViewMain.addArrangedSubview(questionLabel)
    }
    
    private func setupStackViewContainerAnswers() {
        stackViewContainerAnswers.axis = .vertical
        stackViewContainerAnswers.spacing = spacingBetweenAnswerButton
        stackViewContainerAnswers.distribution = .fillEqually
        
        stackViewMain.addArrangedSubview(stackViewContainerAnswers)
    }
    
    private func setupAnswerButtons() {
        
        for _ in 0...3 {
            let button = getButton()
            button.layer.cornerRadius = 30
            stackViewContainerAnswers.addArrangedSubview(button)
            
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 60)])
            
            answerButtons.append(button)
        }
    }
    
    private func getButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle( "Answer ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        
        return button
    }
    
    private func setupStackViewBottom() {
        stackViewBottom.axis = .horizontal
        stackViewBottom.spacing = offSet
        stackViewBottom.distribution = .fillEqually

        stackViewMain.addArrangedSubview(stackViewBottom)
    }
    
    private func setupClueButtons() {
        for _ in 0...2 {
           let button = getButton()
            button.layer.cornerRadius = 30
            button.setTitle(nil, for: .normal)
            button.setImage(.getImageSymbolForButton(with: 20, and: "person.fill"), for: .normal)
            button.tintColor = .white
            
            stackViewBottom.addArrangedSubview(button)
            
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 60),
                button.widthAnchor.constraint(equalToConstant: 100)
            ])
            
            clueButtons.append(button)
        }
    }
    
    
    private func setupStackViewMain() {
        stackViewMain.axis = .vertical
        stackViewMain.spacing = spacingMain
        stackViewMain.distribution = .fillProportionally
        stackViewMain.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackViewMain)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helper
extension UIImage {
    
    /// возвращает сконфигурировыный системный UIImage? для кнопки
    static func getImageSymbolForButton(with size: CGFloat, and systemImage: String) -> UIImage? {
        var imageConfig: UIImage.Configuration
        imageConfig = UIImage.SymbolConfiguration(pointSize: size, weight: .regular, scale: .large)
        let image = UIImage(systemName: systemImage, withConfiguration: imageConfig)
        
        return image
    }
}
