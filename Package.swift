// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = Version("1.46.0")

let gitUrl = "https://maven.sumsub.com/repository/releases/IdensicMobileSDK-iOS/\(version)"

enum checksums {
    static let fisherman = "feed62c7d70ff42791fd348e9bef8311b542a3927bd7f4df341ef7827d83b9bc"
}

let package = Package(
    name: "IdensicMobileSDK_Fisherman",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "IdensicMobileSDK_Fisherman",
            targets: [
                "FishermanWrapper"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SumSubstance/IdensicMobileSDK-iOS.git", .exact(version)),
        .package(url: "https://github.com/fingerprintjs/fingerprintjs-pro-ios", "2.17.1" ..< "3.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "IdensicMobileSDK_Fisherman",
            url: "\(gitUrl)/IdensicMobileSDK_Fisherman-\(version).zip",
            checksum: checksums.fisherman
        ),
        .target(
            name: "FishermanWrapper",
            dependencies: [
                .product(name: "IdensicMobileSDK", package: "IdensicMobileSDK-iOS"),
                "IdensicMobileSDK_Fisherman",
                .product(name: "FingerprintPro", package: "fingerprintjs-pro-ios")
            ],
            path: "FishermanWrapper"
        )
    ]
)
