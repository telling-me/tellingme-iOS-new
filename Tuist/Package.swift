// swift-tools-version: 5.9
import PackageDescription

#if TUIST
import ProjectDescription
import ProjectDescriptionHelpers

let packageSettings = PackageSettings(
    productTypes: [
        "Moya": .staticFramework,
        "SnapKit": .staticFramework,
        "Then": .staticFramework,
        "lottie-ios": .staticFramework,
        "kakao-ios-sdk": .staticFramework
    ]
)

#endif

let package = Package(
    name: "ProxyModuleKit",
    dependencies: [
        .package(
            url: "https://github.com/Moya/Moya.git",
            from: "15.0.3"
        ),
        .package(
            url: "https://github.com/SnapKit/SnapKit.git",
            from: "5.7.1"
        ),
        .package(
            url: "https://github.com/devxoul/Then.git",
            from: "3.0.0"
        ),
        .package(
            url: "https://github.com/airbnb/lottie-ios.git",
            from: "4.4.3"
        ),
        .package(
            url: "https://github.com/kakao/kakao-ios-sdk.git",
            from: "2.22.2"
        )
    ]
)
