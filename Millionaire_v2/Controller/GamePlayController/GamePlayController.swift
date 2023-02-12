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
    
    private var rightNavBarButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = gamePlayView
        setup()
    }
    
    private func setup() {
        
        addTargetForAnswerButtons()
        addTargetForClueButtons()
        
        setupShowTableResult()
        
        updateUI()
    }
    
    private func setupShowTableResult() {
        let image = UIImage(systemName: "dollarsign.circle.fill")
        rightNavBarButton = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(showTableResult))
        navigationItem.setRightBarButton(rightNavBarButton, animated: true)
    }
    
    private func updateUI() {
        let buttons = gamePlayView.containerAnswerButton.answerButtons
        buttons.enumerated().forEach { index, button in
            let answer = gameBrain.getAnswer(index)
            button.setTitle(answer, for: .normal)
            gamePlayView.configureQiestionLabel(gameBrain.getQuestion())
        }
    }
    
    private func addTargetForAnswerButtons() {
        let buttons = gamePlayView.containerAnswerButton.answerButtons
        buttons.forEach { button in
            button.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        }
    }
    
    private func addTargetForClueButtons() {
        let buttons = gamePlayView.containerClueView.clueButtons
        buttons.forEach { button in
            button.addTarget(self, action: #selector(clueButtonPressed), for: .touchUpInside)
        }
    }
    
    @objc func showTableResult(_ sender: UIButton) {
        let resultVC = GameResultViewConroller()
        navigationController?.pushViewController(resultVC, animated: true)
    }
    
    @objc func comeBackPressed(_ sender: UIButton) {
        dismiss(animated: true)
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
