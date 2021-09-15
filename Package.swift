// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "unstandard-ui",
    platforms: [
        .macOS(.v12),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        
    ],
    products: [
        .library(
            name: "UnstandardUI",
            targets: ["UnstandardUI"]),
        
    ],
    dependencies: [
        .package(url: "https://github.com/christopherweems/unstandard.git", from: "0.3.3"),
        
    ],
    targets: [
        .target(
            name: "UnstandardUI",
            dependencies: [
                .product(name: "unstandard", package: "unstandard"),
                
            ]),
        
        .testTarget(
            name: "UnstandardUITests",
            dependencies: ["UnstandardUI"]),
        
    ]
    
)
