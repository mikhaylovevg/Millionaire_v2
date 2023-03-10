//
//  GamePlayController.swift
//  Millionaire_v2
//
//  Created by Павел Грицков on 10.02.23.
//

import UIKit
import AVFoundation

class GamePlayController: UIViewController {
    
    private let gamePlayView = GamePlayView()
    
    private var player = Player()
    private var gameBrain: GameBrain?
    
    var totalTime = 30
    var timer = Timer()
    
    private var rightNavBarButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = gamePlayView
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
        newGameOrContinue()
        isInterface(false)
    }
    
    private func setup() {
        newGameOrContinue()
        
        addTargetForAnswerButtons()
        addTargetForClueButtons()
    }
    
    private func newGameOrContinue() {
        if gameBrain == nil {
            gameBrain = GameBrain()
        }
    }

    private func updateUI() {
        gamePlayView.timerView.timerLabel.text = "\(self.totalTime)"
        let buttons = gamePlayView.containerAnswerButton.answerButtons
        buttons.enumerated().forEach { index, button in
            let answer = gameBrain!.getAnswer(index) // Force-unwrap
            button.setTitle(answer, for: .normal)
            button.setBackgroundImage(UIImage(named: R.Images.AnswerButton.blue), for: .normal)
            button.alpha = 1
            gamePlayView.configureQiestionLabel(gameBrain!.getQuestion()) // Force-unwrap
        }
        player.playSound(resource: "waitForResponse")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    
    private func isInterface(_ locked: Bool ) {
        let buttons = gamePlayView.containerAnswerButton.answerButtons
        let clueButtons = gamePlayView.containerClueView
        
        if locked {
            buttons.forEach {
                $0.isEnabled = false
            }
            clueButtons.isUserInteractionEnabled = false
            clueButtons.alpha = 0.5
        } else {
            buttons.forEach {
                $0.isEnabled = true
            }
            clueButtons.isUserInteractionEnabled = true
            clueButtons.alpha = 1.0
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
    
    @objc func showTableResult() {
        let prizeTableVC = PrizeTableConroller()
        prizeTableVC.delegate = self
        prizeTableVC.brain = gameBrain
        navigationController?.pushViewController(prizeTableVC, animated: true)
    }
    
    @objc func answerButtonPressed(_ sender: UIButton) {
        
        timer.invalidate()
        totalTime = 30
        
        isInterface(true)
        player.playSound(resource: "waitForInspection")
        sender.setBackgroundImage(UIImage(named: R.Images.AnswerButton.yellow), for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            
            guard let self = self else { return }
            
            if self.gameBrain!.checkAnswer(sender.currentTitle) {  // Force-unwrap
                // верный ответ
                self.gameBrain!.didCorrectAnswer() // Force-unwrap
                
                self.player.playSound(resource: "correctAnswer")
                sender.setBackgroundImage(UIImage(named: R.Images.AnswerButton.green), for: .normal)
                self.gameBrain!.nextQuestion() // Force-unwrap
                
                Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.showTableResult), userInfo: nil, repeats: false)
                
            } else {
                self.player.playSound(resource: "wrongAnswer")
                sender.setBackgroundImage(UIImage(named: R.Images.AnswerButton.red), for: .normal)
                Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.gameOverScreen), userInfo: nil, repeats: false)
            }
        }
    }
    
    @objc func gameOverScreen() {
        let vc = GameOverViewController()
        if let brain = gameBrain {
            vc.configureWinLabel(brain.getUserMoney())
            vc.configureLevelLabel(brain.getScore())
            show(vc, sender: nil)
        } else {
            print("Wrong! gameOverScreen")
        }
        timer.invalidate()
    }
    
    @objc func clueButtonPressed(_ sender: UIButton) {
        if sender.currentBackgroundImage == UIImage(named: R.Images.ClueButton.fiftyFifty) {
            let buttons = gamePlayView.containerAnswerButton.answerButtons
            let answers = gameBrain!.getClueFiftyFifty()
            
            buttons.enumerated().forEach { index, button in
                if button.currentTitle == answers[0] || button.currentTitle == answers[1] {
                    button.alpha = 1
                } else {
                    button.alpha = 0
                }
            }
            
            sender.setBackgroundImage(UIImage(named: R.Images.UsedClueButton.usedFiftyFifty), for: .normal)
            sender.isEnabled = false
        } else if sender.currentBackgroundImage == UIImage(named: R.Images.ClueButton.helpAudience) {
            let message = "Зал проголосовал за ответ \(gameBrain!.getClueHallHelp())" // Force-unwrap
            alert(title: "Помощь зала", message: message)
            sender.setBackgroundImage(UIImage(named: R.Images.UsedClueButton.usedHelpAudience), for: .normal)
            sender.isEnabled = false
        } else {
            let message = "Ваш друг считает что правильный ответ \(gameBrain!.getClueCallAFriend())" // Force-unwrap
            alert(title: "Звонок другу", message: message)
            sender.setBackgroundImage(UIImage(named: R.Images.UsedClueButton.usedCallFriend), for: .normal)
            sender.isEnabled = false
        }
    }
    
    private func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Хорошо", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @objc func updateTime() {
        if totalTime != 0 {
            totalTime -= 1
            gamePlayView.timerView.timerLabel.text = "\(totalTime)"
        } else {
            timer.invalidate()
            gameOverScreen()
        }
    }
}

extension GamePlayController: PrizeTableConrollerDelegate {
    func changeGameBrain(_ brain: GameBrain?) {
        gameBrain = brain
    }
}
