//
//  ContentView.swift
//  Main content view
//
//  Architecture: MVVM with SwiftUI
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    @EnvironmentObject var appConfig: AppConfiguration
    @StateObject private var viewModel = ContentViewModel()
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
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
                
                VStack(spacing: 24) {
                    // App Icon/Logo
                    Image(systemName: "sparkles")
                        .font(.system(size: 80))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.blue, .purple, .pink],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .padding(.top, 60)
                    
                    // Welcome Text
                    VStack(spacing: 12) {
                        Text("Welcome to")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.white.opacity(0.8))
                        
                        Text("Your iOS App")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    // Info Card
                    VStack(alignment: .leading, spacing: 16) {
                        InfoRow(
                            icon: "swift",
                            title: "Swift",
                            description: "Modern, safe, and fast"
                        )
                        
                        InfoRow(
                            icon: "paintbrush.pointed.fill",
                            title: "SwiftUI",
                            description: "Declarative UI framework"
                        )
                        
                        InfoRow(
                            icon: "square.stack.3d.up.fill",
                            title: "MVVM Architecture",
                            description: "Clean & scalable"
                        )
                    }
                    .padding(24)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.ultraThinMaterial)
                    )
                    .padding(.horizontal, 24)
                    
                    Spacer()
                    
                    // CTA Button
                    Button {
                        viewModel.handleGetStarted()
                    } label: {
                        Text("Get Started")
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
                }
            }
        }
    }
}

// MARK: - Info Row Component

struct InfoRow: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
    }
}

// MARK: - Preview

#Preview {
    ContentView()
        .environmentObject(AppConfiguration())
}
