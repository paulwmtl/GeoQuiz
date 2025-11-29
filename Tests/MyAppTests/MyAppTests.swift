//
//  MyAppTests.swift
//  Unit tests for MyApp
//

import XCTest
@testable import MyApp

final class MyAppTests: XCTestCase {
    
    // MARK: - User Model Tests
    
    func testUserInitialization() {
        // Given
        let name = "John Doe"
        let email = "john@example.com"
        
        // When
        let user = User(name: name, email: email)
        
        // Then
        XCTAssertEqual(user.name, name)
        XCTAssertEqual(user.email, email)
        XCTAssertNotNil(user.id)
    }
    
    func testUserDisplayName() {
        // Given
        let userWithName = User(name: "Jane Doe", email: "jane@example.com")
        let userWithoutName = User(name: "", email: "user@example.com")
        
        // Then
        XCTAssertEqual(userWithName.displayName, "Jane Doe")
        XCTAssertEqual(userWithoutName.displayName, "user@example.com")
    }
    
    // MARK: - Extension Tests
    
    func testEmailValidation() {
        // Valid emails
        XCTAssertTrue("test@example.com".isValidEmail)
        XCTAssertTrue("user.name@domain.co.uk".isValidEmail)
        XCTAssertTrue("user+tag@example.com".isValidEmail)
        
        // Invalid emails
        XCTAssertFalse("invalid".isValidEmail)
        XCTAssertFalse("@example.com".isValidEmail)
        XCTAssertFalse("user@".isValidEmail)
        XCTAssertFalse("".isValidEmail)
    }
    
    func testStringTruncation() {
        let longString = "This is a very long string that needs truncation"
        
        XCTAssertEqual(longString.truncated(to: 10), "This is a ...")
        XCTAssertEqual(longString.truncated(to: 100), longString)
    }
    
    // MARK: - ViewModel Tests
    
    func testContentViewModelInitialState() {
        // Given
        let viewModel = ContentViewModel()
        
        // Then
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func testContentViewModelLoadData() {
        // Given
        let viewModel = ContentViewModel()
        let expectation = XCTestExpectation(description: "Data loaded")
        
        // When
        viewModel.loadData()
        
        // Then
        XCTAssertTrue(viewModel.isLoading)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertFalse(viewModel.isLoading)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    // MARK: - Network Error Tests
    
    func testNetworkErrorDescriptions() {
        XCTAssertEqual(NetworkError.invalidURL.errorDescription, "Invalid URL")
        XCTAssertEqual(NetworkError.invalidResponse.errorDescription, "Invalid response from server")
        XCTAssertEqual(NetworkError.httpError(statusCode: 404).errorDescription, "HTTP Error: 404")
        XCTAssertEqual(NetworkError.decodingError.errorDescription, "Failed to decode response")
    }
}
