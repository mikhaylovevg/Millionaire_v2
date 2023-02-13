//
//  LeaderBoardController.swift
//  Millionaire_v2
//
//  Created by Магомед Рамазанов on 12.02.2023.
//

import UIKit

class PrizeTableConroller: UIViewController {
    
    private let gameResultView = PrizeTableView()
    
    var brain: GameBrain?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = gameResultView
        starsSetup()
    }
    
    private func starsSetup() {
        
        let testColor: [ColorPrize] = [.violet, .yellow, .green]
        var cost = 100
        
        for i in 0..<15 {
            let randomInt = Int.random(in: 0..<testColor.count)

            gameResultView.configureNumberQuestion(by: i, to: i + 1)
            gameResultView.configureImageQuestion(by: i, to: testColor[randomInt])
            gameResultView.configureCostQuestion(by: i, to: cost)
            
            print("cost: \(cost), index: \(i)")
            cost += cost * 2
        }
    
    }
}
