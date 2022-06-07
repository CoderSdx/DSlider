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
        // Mixed languages are not supported now. Go MJExtension project to see tests.
//        .testTarget(
//            name: "MJExtensionTests",
//            dependencies: ["MJExtension"],
//            path: "MJExtensionTests",
//            exclude: ["Info.plist"]
//        )
    ]
)
