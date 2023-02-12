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
    
    private func newGameButtonTarget() {
        gameOverView.newGameButton.addTarget(self, action: #selector(newGameButtonTapped), for: .touchUpInside)
    }
    
    private func mainScreenButtonTarget() {
        gameOverView.mainScreenButton.addTarget(self, action: #selector(mainScreenButtonTapped), for: .touchUpInside)
    }
    
    @objc private func newGameButtonTapped() {
        let vc = GamePlayController()
        vc.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func mainScreenButtonTapped() {
        let vc = MainScreenViewController()
        vc.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
