//
//  LeaderBoardController.swift
//  Millionaire_v2
//
//  Created by Магомед Рамазанов on 12.02.2023.
//

import UIKit

class GameResultViewConroller: UIViewController {
    
    let gameResultView = GameResultView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = gameResultView
        example()
    }
    
    private func example() {
        let colors: [ColorTableResult] = [.violet, .green, .blue, .yellow, .red]
        
        
        for index in 0...14 {
            let randomIndex = Int.random(in: 0..<colors.count)
            gameResultView.configereResultTable(index, color: colors[randomIndex], text: "result \(index)")
        }
    }
}
