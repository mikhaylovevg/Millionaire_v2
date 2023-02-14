//
//  MainScreenViewController.swift
//  Millionaire_v2
//
//  Created by Иван Осипов on 11.02.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    let mainScreenView = MainScreenView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainScreenView
        navigationController?.navigationBar.isHidden = true
        rulesGameButtonTarget()
        startGameButtonTarget()
    }
    
    private func rulesGameButtonTarget() {
        mainScreenView.rulesGameButton.addTarget(self, action: #selector(rulesGameButtonTapped), for: .touchUpInside)
    }
    
    private func startGameButtonTarget() {
        mainScreenView.startGameButton.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
    }
    
    @objc private func rulesGameButtonTapped() {
        let rulsVC = RulsController()
        navigationController?.pushViewController(rulsVC, animated: true)
    }
    
    @objc private func startGameButtonTapped() {
        let gamePlayVC = GamePlayController()
        gamePlayVC.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(gamePlayVC, animated: true)
    }
    
}
