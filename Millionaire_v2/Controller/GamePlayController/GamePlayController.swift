//
//  GamePlayController.swift
//  Millionaire_v2
//
//  Created by Павел Грицков on 10.02.23.
//

import UIKit

class GamePlayController: UIViewController {
    
    private let gamePlayView = GamePlayView()
    private var gameBrain = GameBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = gamePlayView
        setup()
    }
    
    private func setup() {
        
        addTargetForAnswerButtons()
        addTargetForClueButtons()
        addTargerForBackButton()
        addTargerForShowTableQuestionsButton()
        updateUI()
    }
    
    private func updateUI() {
        let buttons = gamePlayView.answerButtons
        buttons.enumerated().forEach { index, button in
            let answer = gameBrain.getAnswer(index)
            button.setTitle(answer, for: .normal)
            gamePlayView.configureQiestionLabel(gameBrain.getQuestion())
            gamePlayView.configureQuestionNumberLabel(gameBrain.getCostQuestion())
        }
    }
    
    private func addTargetForAnswerButtons() {
        gamePlayView.answerButtons.forEach { button in
            button.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        }
    }
    
    private func addTargetForClueButtons() {
        gamePlayView.clueButtons.forEach { button in
            button.addTarget(self, action: #selector(clueButtonPressed), for: .touchUpInside)
        }
    }
    
    private func addTargerForShowTableQuestionsButton() {
        gamePlayView.showTableQuestionsButton.addTarget(self, action: #selector(showTableQuestions), for: .touchUpInside)
    }
    
    private func addTargerForBackButton() {
        gamePlayView.backButton.addTarget(self, action: #selector(comeBackPressed), for: .touchUpInside)
    }
    
    @objc func showTableQuestions(_ sender: UIButton) {
        print("pressed - showTableQuestions")
    }
    
    @objc func comeBackPressed(_ sender: UIButton) {
        print("pressed - comeBackPressed")
//        dismiss(animated: true)
    }
    
    @objc func answerButtonPressed(_ sender: UIButton) {
        
        if gameBrain.checkAnswer(sender.currentTitle) {
            gameBrain.nextQuestion()
            updateUI()
        } else {
            print("Wrong!!")
        }
    }
    
    @objc func clueButtonPressed(_ sender: UIButton) {
        print("pressed - clueButtonPressed")
    }
}
