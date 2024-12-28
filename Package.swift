// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppCenterCapacitorShared",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AppCenterCapacitorShared",
            targets: ["AppCenterCapacitorShared"]),
    ],
    dependencies: [
        .package(url: "https://github.com/microsoft/appcenter-sdk-apple.git", .upToNextMajor(from: "5.0.5")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AppCenterCapacitorShared",
            dependencies: [
                .product(name: "AppCenterCrashes", package: "appcenter-sdk-apple"),
                .product(name: "AppCenterAnalytics", package: "appcenter-sdk-apple"),
            ],
            path: "AppCenterCapacitorShared/Sources/AppCenterCapacitorShared"
        ),
        .testTarget(
            name: "AppCenterCapacitorSharedTests",
            dependencies: ["AppCenterCapacitorShared"],
            path: "AppCenterCapacitorShared/Tests/AppCenterCapacitorSharedTests"
        ),
    ]
)
