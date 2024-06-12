import ProjectDescription
import ProjectDescriptionHelpers

let infoPlist: [String: Plist.Value] = [
  "CFBundleDevelopmentRegion": "ko_KR",
  "CFBundleShortVersionString": "1.0.0",
  "CFBundleVersion": "1",
  "CFBundleDisplayName": "텔링미 디자인시스템",
  "UIMainStoryboardFile": "",
  "UILaunchStoryboardName": "LaunchScreen",
  "UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"]
]

let project = Project.make(
  name: "DesignSystemApp",
  targets: [
    .target(
      name: "TellingMe-DesignSystem-App",
      destinations: [.iPhone],
      product: .app,
      bundleId: Const.appBundleId + ".designsystem.app",
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      infoPlist: .extendingDefault(with: infoPlist),
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        .project(target: "AppCoreKit", path: "../AppCore", condition: .when(.all)),
        .project(target: "SharedKit", path: "../Shared", condition: .when(.all))
      ]
    )
  ]
)
