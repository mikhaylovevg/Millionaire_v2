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
    private var gameBrain = GameBrain()
    private var player: AVAudioPlayer?
    var totalTime = 30
    var timer = Timer()
    
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
    
    @objc private func updateUI() {
        gamePlayView.timerView.timerLabel.text = "\(self.totalTime)"
        let buttons = gamePlayView.containerAnswerButton.answerButtons
        buttons.enumerated().forEach { index, button in
            let answer = gameBrain.getAnswer(index)
            button.setTitle(answer, for: .normal)
            button.setBackgroundImage(UIImage(named: R.Images.AnswerButton.blue), for: .normal)
            gamePlayView.configureQiestionLabel(gameBrain.getQuestion())
        }
        playSong(song: "waitForResponse")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
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
        let resultVC = PrizeTableConroller()
        resultVC.questions = gameBrain.quiz
        navigationController?.pushViewController(resultVC, animated: true)
    }
    
    @objc func comeBackPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc func answerButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        totalTime = 30
        playSong(song: "waitForInspection")
        sender.setBackgroundImage(UIImage(named: R.Images.AnswerButton.yellow), for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            guard let self = self else { return }
            if self.gameBrain.checkAnswer(sender.currentTitle) {
                // верный ответ
                self.gameBrain.didCorrectAnswer()
                
                self.playSong(song: "correctAnswer")
                sender.setBackgroundImage(UIImage(named: R.Images.AnswerButton.green), for: .normal)
                self.gameBrain.nextQuestion()
                Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.updateUI), userInfo: nil, repeats: false)
                
            } else {
                self.playSong(song: "wrongAnswer")
                sender.setBackgroundImage(UIImage(named: R.Images.AnswerButton.red), for: .normal)
                Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.gameOverScreen), userInfo: nil, repeats: false)
            }
        }
    }
    
    @objc func gameOverScreen() {
        let vc = GameOverViewController()
        vc.navigationItem.hidesBackButton = true
        vc.gameOverView.levelLabel.text = "Уровень \(gameBrain.getScore())"
        vc.gameOverView.winningAmountLabel.text = gameBrain.getSum()
        show(vc, sender: nil)
        timer.invalidate()
    }
    
    @objc func clueButtonPressed(_ sender: UIButton) {
        if sender.currentBackgroundImage == UIImage(named: R.Images.ClueButton.fiftyFifty) {

            sender.setBackgroundImage(UIImage(named: R.Images.UsedClueButton.usedFiftyFifty), for: .normal)
            sender.isEnabled = false
        } else if sender.currentBackgroundImage == UIImage(named: R.Images.ClueButton.helpAudience) {
            let message = "Зал проголосовал за ответ \(gameBrain.getCurrentAnswer())"
            alert(title: "Помощь зала", message: message)
            sender.setBackgroundImage(UIImage(named: R.Images.UsedClueButton.usedHelpAudience), for: .normal)
            sender.isEnabled = false
        } else {
            let message = "Ваш друг считает что правильный ответ \(gameBrain.getCurrentAnswer())"
            alert(title: "Звонок другу", message: message)
            sender.setBackgroundImage(UIImage(named: R.Images.UsedClueButton.usedCallFriend), for: .normal)
            sender.isEnabled = false
        }
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Хорошо", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func playSong(song: String) {
        guard let url = Bundle.main.url(forResource: song, withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
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
