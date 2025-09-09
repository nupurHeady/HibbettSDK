// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HibbettSDK",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "HibbettSDK",
            targets: ["HibbettSDK"]
        )
    ],
    dependencies: [
            .package(url: "https://github.com/makeitheady/pcf-swift.git", branch: "create-spm"),
            .package(url: "https://github.com/SVProgressHUD/SVProgressHUD", .upToNextMajor(from: "2.3.1")),
            .package(url: "https://github.com/makeitheady/GenericValidator.git", branch:"create-spm"),
            .package(url: "https://github.com/makeitheady/Optik.git", branch: "create-spm"),
            .package(url: "https://github.com/makeitheady/Caishen.git", branch: "convert-spm"),
        ],
    targets: [
        .target(
            name: "HibbettSDK",
            dependencies: [
                           .product(name: "PCFSwift", package: "pcf-swift"),
                           .product(name: "SVProgressHUD", package: "svprogresshud"),
                           .product(name: "GenericValidator", package: "genericvalidator"),
                           .product(name: "Optik", package: "optik"),
                           .product(name: "Caishen", package: "caishen"),
                           .product(name: "Core", package: "pcf-swift"),
                           .product(name: "WishlistFeature", package: "pcf-swift")
                       ]
        ),
        .testTarget(
            name: "HibbettSDKTests",
            dependencies: ["HibbettSDK"]
        ),
    ]
)
