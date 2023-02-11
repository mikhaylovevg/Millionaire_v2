//
//  GameBrain.swift
//  Millionaire_v2
//
//  Created by Evgeny Mikhaylov on 11.02.2023.
//

import Foundation

struct GameBrain {
    
    private let quiz = Source.questions
    var questionNumber = 0
    private var score = 0
    
    func getAnswer(_ indexButton: Int) -> String {
        return quiz[score].answer[indexButton]
    }
    
    func getQuestion() -> String {
        return quiz[score].text
    }
    
    func getCostQuestion() -> String {
        return quiz[score].number
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
