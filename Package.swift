// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = Version("1.47.0")

let gitUrl = "https://maven.sumsub.com/repository/releases/IdensicMobileSDK-iOS/\(version)"

enum checksums {
    static let fisherman = "83e670997c28ad9ff2a9551732ec22b6755fd21604a090621cf412053468f07d"
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
        .package(url: "https://github.com/sumsub/IdensicMobileSDK-iOS.git", .exact(version)),
        .package(url: "https://github.com/fingerprintjs/fingerprintjs-pro-ios", "2.17.2" ..< "3.0.0")
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
