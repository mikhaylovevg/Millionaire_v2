//
//  LeaderBoardController.swift
//  Millionaire_v2
//
//  Created by Магомед Рамазанов on 12.02.2023.
//

import UIKit

protocol PrizeTableConrollerDelegate {
    func changeGameBrain(_ brain: GameBrain?)
}

class PrizeTableConroller: UIViewController {
    
    private let prizeTableView = PrizeTableView()
    private var player = Player()
    var delegate: PrizeTableConrollerDelegate?
    
    var brain: GameBrain?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = prizeTableView
        addTargetTakeMoneyButton()
        addTargetContinueGameButton()
        starsSetup()
    }
    
    private func starsSetup() {
        guard let gameBrain = brain else { return }
        let quiz = gameBrain.quiz
        
        for i in 0..<15 {
            prizeTableView.configureNumberQuestion(by: i, to: i + 1)
            prizeTableView.configureCostQuestion(by: i, to: quiz[i].cost)
            
            if quiz[i].isAnswered {
                prizeTableView.configureImageQuestion(by: i, to: .green)
                if i == 14 {
                    player.playSound(resource: "victoryMillion")
                    prizeTableView.isUserInteractionEnabled = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self.alert(title: "Поздравляем!", message: "Вы выйграли 1 000 000 рублей!!!")
                    }
                }
            } else if gameBrain.getScore() == i {
                prizeTableView.configureImageQuestion(by: i, to: .yellow)
            } else if gameBrain.isFireproofMoney(quiz[i].cost) {
                prizeTableView.configureImageQuestion(by: i, to: .blue)
            }
        }
    }
    
    private func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Главная", style: .destructive) { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func addTargetContinueGameButton() {
        prizeTableView.continueGameButton.addTarget(self, action: #selector(continueGamePressed), for: .touchUpInside)
    }
    
    private func addTargetTakeMoneyButton() {
        prizeTableView.takeMoneyButton.addTarget(self, action: #selector(takeMoneyPressed), for: .touchUpInside)
    }
    
    @objc func continueGamePressed() {
        delegate?.changeGameBrain(brain)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func takeMoneyPressed() {
        let vc = GameOverViewController()
        if let brain = brain {
            vc.configureLevelLabel(brain.getScore())
            vc.configureWinLabel(brain.takeMoney())
            show(vc, sender: nil)
        } else {
            print("Wrong! - takeMoneyPressed")
        }
    }
}
