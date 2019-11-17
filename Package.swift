// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "PMSuperButton",
    products: [
        .library(name: "PMSuperButton", targets: ["PMSuperButton-iOS"])
    ],
    targets: [
        .target(
            name: "PMSuperButton-iOS"
        )
    ]
)
