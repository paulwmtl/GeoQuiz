//
//  AppConfiguration.swift
//  App-wide configuration and state
//
//  Architecture: MVVM with SwiftUI
//

import Foundation
import Combine

/// Manages app-wide state and configuration
class AppConfiguration: ObservableObject {
    // MARK: - Published Properties
    
    @Published var isDarkMode: Bool = false
    @Published var isFirstLaunch: Bool = true
    
    // MARK: - Initialization
    
    init() {
        // Initialize app configuration
        loadConfiguration()
    }
    
    // MARK: - Private Methods
    
    private func loadConfiguration() {
        // Load user preferences from UserDefaults
        isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        isFirstLaunch = !UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
        
        if isFirstLaunch {
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
        }
    }
    
    // MARK: - Public Methods
    
    func toggleDarkMode() {
        isDarkMode.toggle()
        UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
    }
    
    func markOnboarded() {
        isFirstLaunch = false
        UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
    }
}
