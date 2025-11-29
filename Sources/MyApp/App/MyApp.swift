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
