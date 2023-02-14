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
    
    func takeMoney() -> Int {
        return userMoney
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
    
    func getCorrectAnswer() -> String {
        return quiz[score].rightAnswer
    }
    
    func getRandomIncorrectAnswer() -> String {
        let answersArray = quiz[score].answers
        let rightAnswer = quiz[score].rightAnswer
        var inCorrectAnswerArray: [String] = []
        
        for i in answersArray {
            if i == rightAnswer {
                continue
            } else {
                inCorrectAnswerArray.append(i)
            }
        }
        
        return inCorrectAnswerArray[Int.random(in: 0...inCorrectAnswerArray.count - 1)]
    }
    
    func getClueFiftyFifty() -> [String] {
        var finalyArray: [String] = []
        let incorrectAnswer = self.getRandomIncorrectAnswer()
        let rightAnswer = self.getCorrectAnswer()
        finalyArray.append(rightAnswer)
        finalyArray.append(incorrectAnswer)
        return finalyArray
    }
    
    func getClueHallHelp() -> String {
        let randomInt = Int.random(in: 1...100)
        let incorrectAnswer = self.getRandomIncorrectAnswer()
        let rightAnswer = self.getCorrectAnswer()
        
        switch randomInt {
        case 1...70:
            return rightAnswer
        default:
            return incorrectAnswer
        }
    }
    
    func getClueCallAFriend() -> String {
        let randomInt = Int.random(in: 1...100)
        let incorrectAnswer = self.getRandomIncorrectAnswer()
        let rightAnswer = self.getCorrectAnswer()
        
        switch randomInt {
        case 1...80:
            return rightAnswer
        default:
            return incorrectAnswer
        }
    }
    
    func getScore() -> String {
        return "\(score)"
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func checkAnswer(_ userAnswer: String?) -> Bool {
        if userAnswer == quiz[score].rightAnswer {
            increaseUserMoney()
            return true
        } else {
            return false
        }
    }
    
    mutating private func increaseUserMoney() {
        userMoney = quiz[score].cost
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
