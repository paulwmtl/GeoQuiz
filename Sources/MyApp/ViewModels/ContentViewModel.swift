//
//  ContentViewModel.swift
//  View model for ContentView
//
//  Architecture: MVVM pattern
//

import Foundation
import Combine

/// View model handling business logic for ContentView
class ContentViewModel: ObservableObject {
    // MARK: - Published Properties
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    // MARK: - Private Properties
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    
    init() {
        setupBindings()
    }
    
    // MARK: - Setup
    
    private func setupBindings() {
        // Setup any Combine publishers/subscribers here
    }
    
    // MARK: - Public Methods
    
    func handleGetStarted() {
        print("Get Started tapped!")
        // Implement navigation or action logic here
        // Example: Navigate to next screen, trigger onboarding, etc.
    }
    
    func loadData() {
        isLoading = true
        
        // Simulate async data loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.isLoading = false
            // Handle loaded data
        }
    }
    
    // MARK: - Private Methods
    
    private func handleError(_ error: Error) {
        errorMessage = error.localizedDescription
        print("Error: \(error.localizedDescription)")
    }
}
