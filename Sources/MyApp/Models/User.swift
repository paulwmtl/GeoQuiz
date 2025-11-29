//
//  User.swift
//  User model example
//
//  Architecture: MVVM - Model layer
//

import Foundation

/// User model representing a user in the app
struct User: Identifiable, Codable {
    // MARK: - Properties
    
    let id: UUID
    var name: String
    var email: String
    var profileImageURL: String?
    var createdAt: Date
    
    // MARK: - Initialization
    
    init(
        id: UUID = UUID(),
        name: String,
        email: String,
        profileImageURL: String? = nil,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.email = email
        self.profileImageURL = profileImageURL
        self.createdAt = createdAt
    }
}

// MARK: - Example Extension

extension User {
    /// Returns a formatted display name
    var displayName: String {
        name.isEmpty ? email : name
    }
    
    /// Sample user for previews and testing
    static var preview: User {
        User(
            name: "John Doe",
            email: "john@example.com",
            profileImageURL: "https://via.placeholder.com/150"
        )
    }
}
