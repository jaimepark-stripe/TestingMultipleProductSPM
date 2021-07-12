
// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ManyProducts",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "OtherProduct",
            targets: ["MultipleProductsSPMExample"]),
        .library(
            name: "ScanProduct",
            targets: ["ScanProduct"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MultipleProductsSPMExample",
            path: "OtherProduct/",
            exclude: [
                "Sources/MultipleProductsSPMExample/Info.plist",
                "Tests/MultipleProductsSPMExampleTests/Info.plist",
                "Tests/MultipleProductsSPMExampleUITests/Info.plist"
            ],
            resources: [
                .process("Info.plist")
            ]
        ),
        .target(
            name: "ScanProduct",
            path: "ScanProduct/ScanProduct",
            exclude: ["Info.plist"],
            resources: [
                .process("Info.plist")
            ]
        )
    ]
)
