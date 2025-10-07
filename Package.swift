// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ControlKitBase",
    platforms: [
         .iOS(.v13)
    ],
    products: [
        .library(
            name: "ControlKitBase",
            targets: ["ControlKitBase"]
        ),
    ],
    targets: [
        .target(
            name: "ControlKitBase",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "ControlKitBaseTests",
            dependencies: ["ControlKitBase"]
        ),
    ]
)
