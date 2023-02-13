//
//  LeaderBoardController.swift
//  Millionaire_v2
//
//  Created by Магомед Рамазанов on 12.02.2023.
//

import UIKit

class PrizeTableConroller: UIViewController {
    
    private let prizeTableView = PrizeTableView()
//    private let gameBrain = GameBrain()
    
    var brain: GameBrain?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = prizeTableView
        addTargetTakeMoneyButton()
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
            } else if gameBrain.getScore() == i {
                prizeTableView.configureImageQuestion(by: i, to: .yellow)
            } else if gameBrain.isFireproofMoney(quiz[i].cost) {
                prizeTableView.configureImageQuestion(by: i, to: .blue)
            }
        }
    }
    
    private func addTargetTakeMoneyButton() {
        prizeTableView.takeMoneyButton.addTarget(self, action: #selector(takeMoney), for: .touchUpInside)
    }
    
    @objc func takeMoney() {
        print("takeMoney")
    }
}
