//
//  QuizView.swift
//  GeoQuiz
//
//  Main quiz view with beautiful UI
//

import SwiftUI

struct QuizView: View {
    @StateObject private var viewModel = QuizViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.2, blue: 0.45),
                    Color(red: 0.2, green: 0.1, blue: 0.35)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            if viewModel.state.isFinished {
                ResultView(
                    score: viewModel.state.score,
                    total: viewModel.questions.count,
                    percentage: viewModel.scorePercentage,
                    onRestart: {
                        viewModel.restartQuiz()
                    },
                    onClose: {
                        dismiss()
                    }
                )
            } else if let question = viewModel.currentQuestion {
                VStack(spacing: 24) {
                    // Header with progress
                    VStack(spacing: 12) {
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.white.opacity(0.7))
                            }
                            
                            Spacer()
                            
                            Text("\(viewModel.state.currentQuestionIndex + 1)/\(viewModel.questions.count)")
                                .font(.headline)
                                .foregroundColor(.white.opacity(0.9))
                            
                            Spacer()
                            
                            Text("🏆 \(viewModel.state.score)")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 24)
                        
                        ProgressView(value: viewModel.progress)
                            .tint(.white)
                            .padding(.horizontal, 24)
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    // Flag Display
                    Text(question.flagEmoji)
                        .font(.system(size: 120))
                        .padding()
                        .background(
                            Circle()
                                .fill(.ultraThinMaterial)
                                .frame(width: 200, height: 200)
                        )
                    
                    Text("Welches Land ist das?")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.top, 8)
                    
                    Spacer()
                    
                    // Answer Options
                    VStack(spacing: 12) {
                        ForEach(question.options, id: \.self) { option in
                            AnswerButton(
                                text: option,
                                isSelected: viewModel.state.selectedAnswer == option,
                                isCorrect: viewModel.state.selectedAnswer != nil && option == question.correctAnswer,
                                isWrong: viewModel.state.selectedAnswer == option && option != question.correctAnswer,
                                action: {
                                    viewModel.selectAnswer(option)
                                }
                            )
                        }
                    }
                    .padding(.horizontal, 24)
                    
                    // Next Button
                    if viewModel.state.selectedAnswer != nil {
                        Button {
                            withAnimation {
                                viewModel.nextQuestion()
                            }
                        } label: {
                            Text("Weiter")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(
                                    LinearGradient(
                                        colors: [.blue, .purple],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(12)
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 40)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    } else {
                        Spacer()
                            .frame(height: 80)
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

// MARK: - Answer Button Component

struct AnswerButton: View {
    let text: String
    let isSelected: Bool
    let isCorrect: Bool
    let isWrong: Bool
    let action: () -> Void
    
    var backgroundColor: Color {
        if isCorrect {
            return .green
        } else if isWrong {
            return .red
        } else if isSelected {
            return .blue
        } else {
            return .white.opacity(0.1)
        }
    }
    
    var icon: String? {
        if isCorrect {
            return "checkmark.circle.fill"
        } else if isWrong {
            return "xmark.circle.fill"
        }
        return nil
    }
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                if let icon = icon {
                    Image(systemName: icon)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(backgroundColor)
            .cornerRadius(12)
        }
        .disabled(isSelected || isCorrect || isWrong)
        .animation(.spring(), value: isSelected)
    }
}

// MARK: - Result View

struct ResultView: View {
    let score: Int
    let total: Int
    let percentage: Int
    let onRestart: () -> Void
    let onClose: () -> Void
    
    var emoji: String {
        switch percentage {
        case 90...100: return "🏆"
        case 70..<90: return "🎉"
        case 50..<70: return "👍"
        default: return "💪"
        }
    }
    
    var message: String {
        switch percentage {
        case 90...100: return "Perfekt!"
        case 70..<90: return "Sehr gut!"
        case 50..<70: return "Gut gemacht!"
        default: return "Weiter üben!"
        }
    }
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Text(emoji)
                .font(.system(size: 100))
            
            VStack(spacing: 12) {
                Text(message)
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
                
                Text("\(score) von \(total) richtig")
                    .font(.title2)
                    .foregroundColor(.white.opacity(0.8))
                
                Text("\(percentage)%")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .purple, .pink],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            }
            
            Spacer()
            
            VStack(spacing: 16) {
                Button {
                    withAnimation {
                        onRestart()
                    }
                } label: {
                    Text("Nochmal spielen")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(12)
                }
                
                Button {
                    onClose()
                } label: {
                    Text("Zurück")
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.8))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
    }
}

// MARK: - Preview

#Preview {
    QuizView()
}
