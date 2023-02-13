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
    var delegate: PrizeTableConrollerDelegate?
    
    var brain: GameBrain?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
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
            } else if gameBrain.getScore() == i {
                prizeTableView.configureImageQuestion(by: i, to: .yellow)
            } else if gameBrain.isFireproofMoney(quiz[i].cost) {
                prizeTableView.configureImageQuestion(by: i, to: .blue)
            }
        }
    }
    
    private func addTargetContinueGameButton() {
        prizeTableView.continueGameButton.addTarget(self, action: #selector(continueGamePressed), for: .touchUpInside)
    }
    
    private func addTargetTakeMoneyButton() {
        prizeTableView.takeMoneyButton.addTarget(self, action: #selector(takeMoneyPressed), for: .touchUpInside)
    }
    
    @objc func continueGamePressed() {
        print("continueGamePressed")
        delegate?.changeGameBrain(brain)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func takeMoneyPressed() {
        print("takeMoneyPressed")
    }
}
