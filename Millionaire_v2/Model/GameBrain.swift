//
//  GameBrain.swift
//  Millionaire_v2
//
//  Created by Evgeny Mikhaylov on 11.02.2023.
//

import Foundation

struct GameBrain {
    
    // переменная для подсчета выйграша
    private var userMoney = 0
    
    // несгораеммые суммы
    private let fireproofMoney: [Int] = [1000, 32_000, 1000_000]
    
    var quiz = Source().getQuestion()
    
    private var score = 0
    
    
    // MARK: - Methods
    
    func getUserMoney() -> Int {
    
        switch userMoney {
        case fireproofMoney[0]..<fireproofMoney[1] :
            return fireproofMoney[0]
        case fireproofMoney[1]..<fireproofMoney[2] :
            return fireproofMoney[1]
        case fireproofMoney[2] :
            return fireproofMoney[2]
        default: return 0
        }
    }
    
    func isFireproofMoney(_ costQuestion: Int) -> Bool {
        fireproofMoney.contains(costQuestion)
    }
    
    func getAnswer(_ indexButton: Int) -> String {
        return quiz[score].answers[indexButton]
    }
    
    func getQuestion() -> String {
        return quiz[score].text
    }
    
    func getCostQuestion() -> String {
        return "\(quiz[score].cost)"
    }
    
    mutating func didCorrectAnswer() {
        quiz[score].isAnswered = true
    }
    
    func getCurrentAnswer() -> String {
        return quiz[score].rightAnswer
    }
    
    func getScore() -> String {
        return "\(score)"
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getSum() -> String {
        if score == 0 {
            return "💰0 рублей"
        } else {
            return "\(quiz[score - 1].cost)"
        }
    }
    
    func checkAnswer(_ userAnswer: String?) -> Bool {
        if userAnswer == quiz[score].rightAnswer {
            return true
        } else {
            return false
        }
    }
    
    mutating func nextQuestion() {
        let count = quiz.count
        if score < count - 1 {
            score += 1
        } else {
            score = 0
        }
    }

}
