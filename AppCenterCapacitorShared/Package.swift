// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AppCenterCapacitorShared",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AppCenterCapacitorShared",
            targets: ["AppCenterCapacitorShared"]),
    ],
    dependencies: [
        .package(name: "AppCenter", url: "https://github.com/microsoft/appcenter-sdk-apple.git", from: "5.0.0")
    ],
    targets: [
        .target(
            name: "AppCenterCapacitorShared",
            dependencies: [
                .product(name: "AppCenterAnalytics", package: "AppCenter"),
                .product(name: "AppCenterCrashes", package: "AppCenter"),
                .product(name: "AppCenterDistribute", package: "AppCenter")
            ],
            path: "Sources"),
        .testTarget(
            name: "AppCenterCapacitorSharedTests",
            dependencies: ["AppCenterCapacitorShared"],
            path: "Tests"
        )
    ]
)
