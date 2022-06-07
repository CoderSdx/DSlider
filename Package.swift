// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DSlider",
    products: [
        .library(name: "DSlider", targets: ["DSlider"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DSlider",
            dependencies: [],
            path: "DSlider",
            exclude: ["Info.plist"],
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("."),
            ]
        ),
    ]
)
