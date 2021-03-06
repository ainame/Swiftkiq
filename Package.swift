// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Lumpik",
    products: [
        .library(name: "Lumpik", targets: ["Lumpik"]),
        .library(name: "LumpikStatic",  type: .static,  targets: ["Lumpik"]),
        .library(name: "LumpikDynamic", type: .dynamic, targets: ["Lumpik"]),
        .executable(name: "Examples", targets: ["Examples"]),
        .executable(name: "Benchmark", targets: ["Benchmark"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/redis.git", from: "2.0.0"),
        .package(url: "https://github.com/ainame/Swift-Daemon.git", from: "0.0.1"),
        .package(url: "https://github.com/IBM-Swift/BlueSignals.git", from: "0.1.0"),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", from: "1.0.0"),
        .package(url: "https://github.com/kylef/Commander.git", from: "0.1.0"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "Lumpik",
            dependencies: [
                "Redis",
                "Daemon",
                "Signals",
                "SwiftyBeaver",
                "Commander",
                "Yams"
            ],
            exclude: [
                "Sources/Examples",
                "Sources/Benchmark"
            ]
        ),
        .testTarget(
            name: "LumpikTests",
            dependencies: ["Lumpik"]
        ),
        .target(
            name: "Examples",
            dependencies: ["Lumpik"],
            exclude: [
                "Sources/Examples",
            ]
        ),
        .target(
            name: "Benchmark",
            dependencies: ["Lumpik"],
            exclude: [
                "Sources/Benchmark",
            ]
        )
    ]
)
