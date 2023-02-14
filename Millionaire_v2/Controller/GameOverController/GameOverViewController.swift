//
//  GameOverViewController.swift
//  Millionaire_v2
//
//  Created by Иван Осипов on 10.02.2023.
//

import UIKit

class GameOverViewController: UIViewController {
    
    let gameOverView = GameOverView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = gameOverView
        newGameButtonTarget()
        mainScreenButtonTarget()
    }
    
    func configureWinLabel(_ prize: Int) {
        gameOverView.winningAmountLabel.text = "💰 \(prize)"
    }
    
    func configureLevelLabel(_ level: Int) {
        gameOverView.levelLabel.text = "Уровень \(level)"
    }
    
    private func newGameButtonTarget() {
        gameOverView.newGameButton.addTarget(self, action: #selector(newGameButtonTapped), for: .touchUpInside)
    }
    
    private func mainScreenButtonTarget() {
        gameOverView.mainScreenButton.addTarget(self, action: #selector(mainScreenButtonTapped), for: .touchUpInside)
    }
    
    @objc private func newGameButtonTapped() {
        let vc = GamePlayController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func mainScreenButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
