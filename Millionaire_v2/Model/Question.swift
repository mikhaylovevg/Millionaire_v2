//
//  QuestionModel.swift
//  Millionaire_v2
//
//  Created by Evgeny Mikhaylov on 11.02.2023.
//

import Foundation

enum LevelQuestion {
    case low
    case middle
    case hard
}

struct Question {
    let text: String
    let answers: [String]
    let rightAnswer: String
    
    let levelQuestion: LevelQuestion
    var isAnswered = false
    var cost = 0
}

