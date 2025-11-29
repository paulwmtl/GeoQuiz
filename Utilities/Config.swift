//
//  Config.swift
//  Application Configuration
//
//  Centralized configuration for environment-specific settings
//

import Foundation

/// Application configuration and environment settings
enum Config {
    // MARK: - API Configuration
    
    /// Base URL for API requests
    static let apiBaseURL: String = {
        #if DEBUG
        return "https://api-dev.example.com"
        #else
        return "https://api.example.com"
        #endif
    }()
    
    /// API version
    static let apiVersion = "v1"
    
    /// Full API URL
    static var apiURL: String {
        "\(apiBaseURL)/\(apiVersion)"
    }
    
    // MARK: - App Information
    
    /// App name
    static let appName = "MyApp"
    
    /// App version from Info.plist
    static var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    }
    
    /// Build number from Info.plist
    static var buildNumber: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
    }
    
    /// Full version string
    static var fullVersion: String {
        "\(appVersion) (\(buildNumber))"
    }
    
    // MARK: - Feature Flags
    
    /// Enable debug logging
    static let enableDebugLogging: Bool = {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }()
    
    /// Enable analytics
    static let enableAnalytics: Bool = {
        #if DEBUG
        return false
        #else
        return true
        #endif
    }()
    
    // MARK: - Network Configuration
    
    /// Request timeout in seconds
    static let requestTimeout: TimeInterval = 30
    
    /// Resource timeout in seconds
    static let resourceTimeout: TimeInterval = 300
    
    /// Maximum retry attempts
    static let maxRetryAttempts = 3
    
    // MARK: - Cache Configuration
    
    /// Cache expiration time in seconds
    static let cacheExpirationTime: TimeInterval = 3600 // 1 hour
    
    /// Maximum cache size in bytes
    static let maxCacheSize = 50 * 1024 * 1024 // 50 MB
    
    // MARK: - UI Configuration
    
    /// Default animation duration
    static let defaultAnimationDuration: Double = 0.3
    
    /// Default corner radius
    static let defaultCornerRadius: CGFloat = 12
    
    /// Default padding
    static let defaultPadding: CGFloat = 16
    
    // MARK: - Development
    
    /// Check if running in simulator
    static var isSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
    
    /// Check if running in debug mode
    static var isDebug: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
}

// MARK: - Environment

/// Application environment types
enum Environment: String {
    case development = "Development"
    case staging = "Staging"
    case production = "Production"
    
    /// Current environment
    static var current: Environment {
        #if DEBUG
        return .development
        #else
        return .production
        #endif
    }
}

// MARK: - API Keys (Example - DO NOT COMMIT REAL KEYS)

enum APIKeys {
    /// Example API key - Replace with actual key from secure storage
    static let exampleService: String = {
        // In production, fetch from Keychain or secure configuration
        Environment.current == .production
            ? "prod-api-key-here"
            : "dev-api-key-here"
    }()
    
    // Add more API keys as needed
    // Always use environment variables or secure storage in production
}
