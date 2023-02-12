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
