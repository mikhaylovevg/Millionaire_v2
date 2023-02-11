//
//  GameBrain.swift
//  Millionaire_v2
//
//  Created by Evgeny Mikhaylov on 11.02.2023.
//

import Foundation

class GameBrain {
    
    var questions = Question.questions
    var questionNumber = 0
    var questionRublesText: String?
    var currentQuestion: String?
    var answerA: String?
    var answerB: String?
    var answerC: String?
    var answerD: String?
    var answerCorrect: String?
    
    func getQuestion() {
        currentQuestion = questions[questionNumber].text
        questionRublesText = questions[questionNumber].number
        answerA = questions[questionNumber].answer[0]
        answerB = questions[questionNumber].answer[1]
        answerC = questions[questionNumber].answer[2]
        answerD = questions[questionNumber].answer[3]
        answerCorrect = questions[questionNumber].rightAnswer
        questionNumber += 1
    }
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        let check = userAnswer == answerCorrect
        questions[questionNumber - 1].isAnswered = check // ??? [questionNumber] or [questionNumber - 1]
        return check
    }
    
}
