// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Backend",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Backend",
            targets: ["Backend"]
        ),
        .library(
            name: "BackendInterface",
            targets: ["BackendInterface"]
        ),
    ],
    dependencies: [
        .package(path: "../DependencyInjection"),
        .package(path: "../Utilities")
    ],
    targets: [
        .target(
            name: "BackendInterface",
            dependencies: [.product(name: "DependencyInjection", package: "DependencyInjection")]
        ),
        .target(
            name: "Backend",
            dependencies: [
                "BackendInterface",
                .product(name: "Utilities", package: "Utilities")
            ]
        ),
        .testTarget(
            name: "BackendTests",
            dependencies: ["Backend"]
        ),
    ]
)
