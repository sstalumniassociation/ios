// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LogoKit",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LogoKit",
            targets: ["LogoKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/jiachenyee/ScreenCaptureRedaction", .upToNextMajor(from: "1.1.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LogoKit",
            dependencies: [.product(name: "ScreenCaptureRedaction", package: "ScreenCaptureRedaction")],
            resources: [.process("Assets.xcassets")]
        )
    ]
)
