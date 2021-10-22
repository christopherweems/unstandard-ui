// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "unstandard-ui",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        
    ],
    products: [
        .library(
            name: "UnstandardUI",
            targets: ["UnstandardUI"]),
        
        .library(
            name: "Section",
            targets: ["Section"]),
        
        .library(name: "HapticFeedbackGenerator",
                 targets: ["HapticFeedbackGenerator"]),
        
    ],
    dependencies: [
        .package(url: "https://github.com/christopherweems/unstandard.git", from: "0.3.3"),
        .package(url: "https://github.com/christopherweems/Resultto.git", from: "0.2.1"),
        
    ],
    targets: [
        .target(
            name: "UnstandardUI",
            dependencies: [
                .product(name: "unstandard", package: "unstandard"),
                
            ]),
        
        .target(
            name: "HapticFeedbackGenerator",
            dependencies: [
                .product(name: "Resultto", package: "Resultto"),
                
            ]),
        
        .target(
            name: "Section",
            dependencies: [
                .product(name: "unstandard", package: "unstandard"),
                
            ]),
        
        
        // tests
        
        .testTarget(
            name: "UnstandardUITests",
            dependencies: ["UnstandardUI"]),
        
        .testTarget(
            name: "SectionTests",
            dependencies: ["Section"]),
        
    ]
    
)
