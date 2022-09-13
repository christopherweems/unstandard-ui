// swift-tools-version:5.7
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
            name: "unstandardUI",
            targets: ["unstandardUI"]),
        
        .library(
            name: "Section",
            targets: ["Section"]),
        
        .library(name: "HapticFeedbackGenerator",
                 targets: ["HapticFeedbackGenerator"]),
        
    ],
    dependencies: [
//        .package(url: "https://github.com/christopherweems/unstandard.git", from: "0.5.0"),
        .package(url: "https://github.com/christopherweems/unstandard.git", branch: "main"),
        
    ],
    targets: [
        .target(
            name: "unstandardUI",
            dependencies: [
                .product(name: "unstandard", package: "unstandard"),
                
            ]),
        
        .target(
            name: "HapticFeedbackGenerator",
            dependencies: [
                .product(name: "Resultto", package: "unstandard"),
                
            ]),
        
        .target(
            name: "Section",
            dependencies: [
                .product(name: "unstandard", package: "unstandard"),
                
            ]),
        
        
        // tests
        
        .testTarget(
            name: "unstandardUITests",
            dependencies: ["unstandardUI"]),
        
        .testTarget(
            name: "SectionTests",
            dependencies: ["Section"]),
        
    ]
    
)
