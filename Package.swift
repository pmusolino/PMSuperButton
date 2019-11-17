// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "PMSuperButton",
    products: [
        .library(name: "PMSuperButton", targets: ["PMSuperButton"])
    ],
    targets: [
        .target(
            name: "PMSuperButton",
            path: "PMSuperButton"
        )
    ]
)
