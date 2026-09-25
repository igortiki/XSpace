// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "XSpaceCore",

    platforms: [
        .iOS(.v17),
        .tvOS(.v17)
    ],

    products: [
        .library(
            name: "XSpaceCore",
            targets: ["XSpaceCore"]
        )
    ],

    targets: [
        .target(
            name: "XSpaceCore"
        ),

        .testTarget(
            name: "XSpaceCoreTests",
            dependencies: ["XSpaceCore"]
        )
    ]
)