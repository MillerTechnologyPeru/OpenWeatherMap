// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "OpenWeatherMap",
    products: [
        .library(
            name: "OpenWeatherMap",
            targets: ["OpenWeatherMap"]
        )
    ],
    targets: [
        .target(
            name: "OpenWeatherMap",
            dependencies: []
        ),
        .testTarget(
            name: "OpenWeatherMapTests",
            dependencies: ["OpenWeatherMap"]
        ),
    ]
)
