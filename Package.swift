// swift-tools-version:6.1
import PackageDescription

let package = Package(
    name: "unstandard-ui",
    platforms: [
        .macOS(.v15),
        .iOS(.v18),
        .tvOS(.v18),
        .watchOS(.v11),
        
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
