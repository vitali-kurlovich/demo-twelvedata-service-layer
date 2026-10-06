// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "demo-twelvedata-service-layer",
    platforms: [
        .macOS(.v15),
        .iOS(.v18),
        .watchOS(.v11),
        .tvOS(.v18),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TwelveDataAdapter",
            targets: ["TwelveDataAdapter"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.1.0"),
        .package(url: "https://github.com/vitali-kurlovich/demo-service-layer", from: "0.0.4"),
        .package(url: "https://github.com/vitali-kurlovich/swift-twelvedata", from: "0.3.3"),

    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "TwelveDataAdapter",
            dependencies: [
                .product(name: "DataLayer", package: "demo-service-layer"),
                .product(name: "TwelveDataStream", package: "swift-twelvedata"),
                .product(name: "TwelveDataREST", package: "swift-twelvedata"),
            ]
        ),
    ]
)
