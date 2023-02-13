//
//  LeaderBoardController.swift
//  Millionaire_v2
//
//  Created by Магомед Рамазанов on 12.02.2023.
//

import UIKit

class PrizeTableConroller: UIViewController {
    
    let gameResultView = GameResultView()
    var questions: [Question]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = gameResultView
        starsSetup()
    }
    
    private func starsSetup() {
        
        guard let q = questions else { return }
        
        for (index, _) in q.enumerated().reversed() {
            print(" index : \(index)")
            gameResultView.configereResultTable(for: index, text: "\(q[index].cost)")
            if q[index].isAnswered {
                gameResultView.configureResultTable(for: index, and: .green)
            } else {
                gameResultView.configureResultTable(for: index, and: .blue)
            }
        }
    }
}
