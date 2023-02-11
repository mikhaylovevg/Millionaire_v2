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
    private let backgroundImageView = UIImageView()
    
    private let stackViewMain = UIStackView()
    private let stackViewTop = UIStackView()
    
    let backButton = UIButton()
    private let questionNumberLabel = UILabel()
    let showTableQuestionsButton = UIButton()
    
    private let timerView = TimerView()
    private let questionLabel = UILabel()
    
    private let stackViewContainerAnswers = UIStackView()
    var answerButtons: [UIButton] = [
        .init(type: .system),
        .init(type: .system),
        .init(type: .system),
        .init(type: .system)]
    
    private let stackViewBottom = UIStackView()
    var clueButtons: [UIButton] = [
        .init(type: .system),
        .init(type: .system),
        .init(type: .system)]
    
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
    
    func configureQuestionNumberLabel(_ costQuestion: String) {
        questionNumberLabel.text = costQuestion
    }
    
    /// установить значение таймера в UILabel
    func configureTimerLabel(_ timer: Int) {
        timerView.configureTimerLabel(timer)

        // TODO: над будет подумать какой формат принимает
    }
    
    init() {
        super.init(frame: .zero)
        
      setupView()
        
    }
    
    
    // MARK: - Methods
    
    private func setupView() {
        // view setting
        self.backgroundColor = .white
        
        setupBackgroundImageView()
        
        setupStackViewMain()
        
        setupStackViewTop()
        setupBackButton()
        setupQuestionNumberLabel()
        setupShoeTableQuestionsButton()
        
        setupTimerView()
        setupQuestionLabel()
        
        setupAnswerButtons()
        setupStackViewContainerAnswers()
        
        setupClueButtons()
        setupStackViewBottom()
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
    
    private func setupStackViewContainerAnswers() {
        stackViewContainerAnswers.axis = .vertical
        stackViewContainerAnswers.spacing = spacingBetweenAnswerButton
        stackViewContainerAnswers.distribution = .fillEqually
        
        stackViewMain.addArrangedSubview(stackViewContainerAnswers)
        
        NSLayoutConstraint.activate([
            stackViewContainerAnswers.leftAnchor.constraint(equalTo: stackViewMain.leftAnchor, constant: 20),
            stackViewContainerAnswers.rightAnchor.constraint(equalTo: stackViewMain.rightAnchor, constant: -20)])
    }
    
    private func setupAnswerButtons() {
        
        answerButtons.forEach { button in
            button.setTitle("Answer", for: .normal)
            let image = UIImage(named: R.Images.AnswerButton.blue)
            button.setBackgroundImage(image, for: .normal)
            
            button.tintColor = .white
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            
        // TODO: вызывает ошибку!! (видимо нужно перенести в контроллер)

//            button.layer.shadowColor = UIColor.darkGray.cgColor
//            button.layer.shadowRadius = 4
//            button.layer.shadowOffset = .init(width: 5, height: 5)
//            button.layer.shadowOpacity = 10

            stackViewContainerAnswers.addArrangedSubview(button)

            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 45)])
        }
    }
    
    private func setupStackViewBottom() {
        stackViewBottom.axis = .horizontal
        stackViewBottom.spacing = offSet
        stackViewBottom.distribution = .fillEqually

        stackViewMain.addArrangedSubview(stackViewBottom)
    }
    
    private func setupClueButtons() {
        
        clueButtons.enumerated().forEach { index, button in
            button.setBackgroundImage(getImage(index), for: .normal)
            
            stackViewBottom.addArrangedSubview(button)
            
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 70),
                button.widthAnchor.constraint(equalToConstant: 94)
            ])
        }
    }
    
    private func setupStackViewMain() {
        stackViewMain.axis = .vertical
        stackViewMain.spacing = spacingMain
        stackViewMain.distribution = .fillProportionally
        stackViewMain.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackViewMain)
        
        NSLayoutConstraint.activate([
            stackViewMain.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackViewMain.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: offSet),
            stackViewMain.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -offSet),
            stackViewMain.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
    }
    
    private func getImage(_ index: Int) -> UIImage? {
        switch index {
        case 0: return UIImage(named: R.Images.ClueButton.fiftyFifty)
        case 1: return UIImage(named: R.Images.ClueButton.helpAudience)
        case 2: return UIImage(named: R.Images.ClueButton.callFriend)
        default: return nil
        }
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
