//
//  QuizQuestion.swift
//  GeoQuiz
//
//  Quiz question model
//

import Foundation

struct QuizQuestion: Identifiable, Equatable {
    let id: UUID
    let flagEmoji: String
    let correctAnswer: String
    let options: [String]
    
    init(country: Country, wrongAnswers: [Country]) {
        self.id = UUID()
        self.flagEmoji = country.flagEmoji
        self.correctAnswer = country.name
        
        // Shuffle correct answer with wrong answers
        var allOptions = [country.name] + wrongAnswers.map { $0.name }
        allOptions.shuffle()
        self.options = allOptions
    }
}

// MARK: - Quiz State

struct QuizState {
    var currentQuestionIndex: Int = 0
    var score: Int = 0
    var isFinished: Bool = false
    var selectedAnswer: String? = nil
    var isAnswerCorrect: Bool? = nil
    
    mutating func reset() {
        currentQuestionIndex = 0
        score = 0
        isFinished = false
        selectedAnswer = nil
        isAnswerCorrect = nil
    }
}
