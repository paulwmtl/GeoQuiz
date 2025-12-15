//
//  QuizViewModel.swift
//  GeoQuiz
//
//  ViewModel for quiz logic
//

import Foundation
import SwiftUI

@MainActor
class QuizViewModel: ObservableObject {
    @Published var questions: [QuizQuestion] = []
    @Published var state = QuizState()
    
    private let numberOfQuestions: Int
    private let countries: [Country]
    
    init(numberOfQuestions: Int = 10) {
        self.numberOfQuestions = numberOfQuestions
        self.countries = Country.euCountries
        generateQuestions()
    }
    
    // MARK: - Public Methods
    
    func generateQuestions() {
        var generatedQuestions: [QuizQuestion] = []
        var availableCountries = countries.shuffled()
        
        for _ in 0..<min(numberOfQuestions, availableCountries.count) {
            guard let correctCountry = availableCountries.first else { break }
            availableCountries.removeFirst()
            
            // Get 3 random wrong answers
            let wrongAnswers = availableCountries
                .shuffled()
                .prefix(3)
                .map { $0 }
            
            let question = QuizQuestion(
                country: correctCountry,
                wrongAnswers: Array(wrongAnswers)
            )
            generatedQuestions.append(question)
        }
        
        questions = generatedQuestions
        state.reset()
    }
    
    func selectAnswer(_ answer: String) {
        guard !state.isFinished,
              state.selectedAnswer == nil,
              state.currentQuestionIndex < questions.count else {
            return
        }
        
        let currentQuestion = questions[state.currentQuestionIndex]
        let isCorrect = answer == currentQuestion.correctAnswer
        
        state.selectedAnswer = answer
        state.isAnswerCorrect = isCorrect
        
        if isCorrect {
            state.score += 1
        }
    }
    
    func nextQuestion() {
        state.selectedAnswer = nil
        state.isAnswerCorrect = nil
        state.currentQuestionIndex += 1
        
        if state.currentQuestionIndex >= questions.count {
            state.isFinished = true
        }
    }
    
    func restartQuiz() {
        generateQuestions()
    }
    
    // MARK: - Computed Properties
    
    var currentQuestion: QuizQuestion? {
        guard state.currentQuestionIndex < questions.count else {
            return nil
        }
        return questions[state.currentQuestionIndex]
    }
    
    var progress: Double {
        guard !questions.isEmpty else { return 0 }
        return Double(state.currentQuestionIndex) / Double(questions.count)
    }
    
    var scorePercentage: Int {
        guard !questions.isEmpty else { return 0 }
        return Int((Double(state.score) / Double(questions.count)) * 100)
    }
}
