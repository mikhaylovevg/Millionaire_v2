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
        print("rulesGameButtonTapped")
    }
    
    @objc private func startGameButtonTapped() {
        print("startGameButtonTapped")
    }
    
}
