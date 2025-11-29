//
//  MyApp.swift
//  iOS App Entry Point
//
//  Architecture: MVVM with SwiftUI
//

import SwiftUI

@main
struct MyApp: App {
    // MARK: - Properties
    
    /// State object for app-wide configuration
    @StateObject private var appConfig = AppConfiguration()
    
    // MARK: - Body
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appConfig)
        }
    }
}

// MARK: - App Configuration

/// Manages app-wide state and configuration
class AppConfiguration: ObservableObject {
    @Published var isDarkMode: Bool = false
    @Published var isFirstLaunch: Bool = true
    
    init() {
        // Initialize app configuration
        loadConfiguration()
    }
    
    private func loadConfiguration() {
        // Load user preferences from UserDefaults
        isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        isFirstLaunch = !UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
        
        if isFirstLaunch {
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
        }
    }
}
