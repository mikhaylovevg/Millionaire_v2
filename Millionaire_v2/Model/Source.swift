//
//  Source.swift
//  Millionaire_v2
//
//  Created by Павел Грицков on 11.02.23.
//

import Foundation

struct Source {
    
    private let qCost: [LevelQuestion] = [.low, .middle, .hard]
    
    /// возращает 15 вопросов по 5 каждой сложности
    func getQuestion() -> [Question] {
        var result: [Question] = []
        
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
    
    private func getFiveQuestion(for level: LevelQuestion) -> [Question] {
        var result: [Question] = []
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
    private func setCost(for questions: [Question]) -> [Question] {
        var temp = questions
        var cost = 0
        
        for index in temp.indices {
            switch index {
            case 0...2 :
                cost += 100
                temp[index].cost = cost
            case 3 :
                cost += 200
                temp[index].cost = cost
            case 4..<temp.count - 1 :
                cost = cost * 2
                temp[index].cost = cost
            case 14 : temp[index].cost = 1_000_000
            default: break
            }
        }
        
        return temp
    }
   
    private let questionArray: [Question] = [
        Question(
            text: "Как закончить поговорку - Нет дыма ...?",
            answers: ["А: Без меня", "B: Без огня", "C: Без шашлыка", "D: Без рок-н-ролла"],
            rightAnswer: "B: Без огня",
            levelQuestion: .low),
        Question(
            text: "Аромат какого напитка обычно описывается словом - букет?",
            answers: ["A: Квас", "B: Пиво", "C: Вино", "D: Кефир"],
            rightAnswer: "C: Вино",
            levelQuestion: .low),
        Question(
            text: "Какая березка стояла во поле?",
            answers: ["A: Высокая", "B: Кудрявая", "C: Зеленая", "D: Засохшая"],
            rightAnswer: "B: Кудрявая",
            levelQuestion: .low),
        Question(
            text: "В каком жанре не сочинял Винни-Пух?",
            answers: ["A: Жужжалки", "B: Шумелки", "C: Пыхтелки", "D: Сопелки"],
            rightAnswer: "A: Жужжалки",
            levelQuestion: .low),
        Question(
            text: "Какой русский город изображён на купюре 1000 рублей?",
            answers: ["A: Ярославль", "B: Санкт-Петербург", "C: Москва", "D: Красноярск"],
            rightAnswer: "A: Ярославль",
            levelQuestion: .low),
        Question(
            text: "Сколько струн у контрабаса?",
            answers: ["A: 3", "B: 4", "C: 5", "D: 6"],
            rightAnswer: "B: 4",
            levelQuestion: .middle),
        Question(
            text: "Как иначе называют телосложение?",
            answers: ["A: Конституция", "B: Конструкция", "C: Инструкция", "D: Прокламация"],
            rightAnswer: "A: Конституция",
            levelQuestion: .middle),
        Question(
            text: "Назовите множественное число слова - дно?",
            answers: ["A: Дна", "B: Дны", "C: Доны", "D: Донья"],
            rightAnswer: "D: Донья",
            levelQuestion: .middle),
        Question(
            text: "Горсть чего бросают перед выходом на ковёр борцы сумо?",
            answers: ["A: Риса", "B: Сои", "C: Соли", "D: Опилки"],
            rightAnswer: "C: Соли",
            levelQuestion: .middle),
        Question(
            text: "Какой плод на латыни называется армянской сливой?",
            answers: ["A: Персик", "B: Айва", "C: Алыча", "D: Абрикос"],
            rightAnswer: "D: Абрикос",
            levelQuestion: .middle),
        Question(
            text: "Какой из этих органов не считается частью дыхательной системы?",
            answers: ["A: Гортань", "B: Глотка", "C: Легкое", "D: Пищевод"],
            rightAnswer: "D: Пищевод",
            levelQuestion: .hard),
        Question(
            text: "На каком языке говорит больше всего людей на Земле?",
            answers: ["A: Китайский", "B: Испанский", "C: Арабский", "D: Английский"],
            rightAnswer: "A: Китайский",
            levelQuestion: .hard),
        Question(
            text: "Какой цвет в старину называли червонным?",
            answers: ["A: Белый", "B: Красный", "C: Черный", "D: Желтый"],
            rightAnswer: "B: Красный",
            levelQuestion: .hard),
        Question(
            text: "Как называется отрезок прямой, соединяющий две какие-либо точки окружности?",
            answers: ["A: Луч", "B: Сегмент", "C: Хорда", "D: Медиана"],
            rightAnswer: "C: Хорда",
            levelQuestion: .hard),
        Question(
            text: "Какое животное называют - байбак?",
            answers: ["A: Сурок", "B: Хомяк", "C: Лиса", "D: Кролик"],
            rightAnswer: "A: Сурок",
            levelQuestion: .hard)
    ]
}

