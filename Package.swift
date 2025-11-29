// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyApp",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "MyApp",
            targets: ["MyApp"])
    ],
    dependencies: [
        // Add external dependencies here
        // Example:
        // .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.0")
    ],
    targets: [
        .target(
            name: "MyApp",
            dependencies: [],
            path: "Sources",
            exclude: ["MyApp/App"]),  // Exclude the @main app file from library
        .testTarget(
            name: "MyAppTests",
            dependencies: ["MyApp"],
            path: "Tests")
    ]
)
