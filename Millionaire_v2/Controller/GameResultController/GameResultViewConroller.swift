//
//  LeaderBoardController.swift
//  Millionaire_v2
//
//  Created by Магомед Рамазанов on 12.02.2023.
//

import UIKit

class GameResultViewConroller: UIViewController {
    
    let gameResultView = GameResultView()
    var questions: [Question]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = gameResultView
        starsSetup()
    }
    
    private func starsSetup() {
        
        guard let q = questions else { return }
        
        for (index, element) in q.enumerated().reversed() {
            print(" index : \(index)")
            gameResultView.configereResultTable(for: index, text: element.number)
            if element.isAnswered {
                gameResultView.configureResultTable(for: index, and: .green)
            } else {
                gameResultView.configureResultTable(for: index, and: .blue)
            }
        }
    }
}
