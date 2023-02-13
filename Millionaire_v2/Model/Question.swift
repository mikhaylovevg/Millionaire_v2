//
//  QuestionModel.swift
//  Millionaire_v2
//
//  Created by Evgeny Mikhaylov on 11.02.2023.
//

import Foundation

struct Question {
    let number: String
    let text: String
    var answer: [String]
    var rightAnswer: String
    var isAnswered = false
    
    init(n: String, t: String, a: [String], correctAnswer: String) {
        number = n
        text = t
        answer = a
        rightAnswer = correctAnswer
    }
}

/*
 тут решайм проблему маштабируемости количества вопросов
 */

enum LevelQuestion {
    case low
    case middle
    case hard
}

struct Q {
    let text: String
    let answers: [String]
    let levelQuestion: LevelQuestion
    var isAnswered = false
    var cost = 0
}

struct S {
    
    private let questionArray: [Q] = []
    private let qCost: [LevelQuestion] = [.low, .middle, .hard]
    
    /// возращает 15 вопросов по 5 каждой сложности
    func getQuestion() -> [Q] {
        var result: [Q] = []
        
        qCost.forEach { cost in
            switch cost {
            case .low : result += getFiveQuestion(for: .low)
            case .middle : result += getFiveQuestion(for: .middle)
            case .hard : result += getFiveQuestion(for: .hard)
            }
        }
        
        // назначить стоимость для вопросов
        result = setCost(for: result)
        
        return result
    }
    
    private func getFiveQuestion(for level: LevelQuestion) -> [Q] {
        var result: [Q] = []
        // массив вопросов по нужной категории
        var filteredQuestions = questionArray.filter { element in
            if element.levelQuestion == level {
                return true
            } else {
                return false
            }
        }
        
        for _ in 0..<5 {
            // рандомный индекс для массива отфильтрованных вопросов
            let randomIndex = Int.random(in: 0..<filteredQuestions.count)

            result.append(filteredQuestions.remove(at: randomIndex))
        }
        
        return result
    }
    
    /// задает стоимость для вопросов
    private func setCost(for questions: [Q]) -> [Q] {
        var temp = questions
        var cost = 0
        
        for index in temp.indices {
            switch index {
            case 0...2 :
                temp[index].cost += 100
            case 3 :
                temp[index].cost += 200
            case 4..<temp.count :
                temp[index].cost = (cost * 2)
            default: break
            }
        }
        
        return temp
    }
}
