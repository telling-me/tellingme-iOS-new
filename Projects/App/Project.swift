import ProjectDescription
import ProjectDescriptionHelpers

let infoPlist: [String: Plist.Value] = [
  "CFBundleDevelopmentRegion": "ko_KR",
  "CFBundleShortVersionString": "1.0.0",
  "CFBundleVersion": "1",
  "CFBundleDisplayName": "텔링미",
  "UIMainStoryboardFile": "",
  "UILaunchStoryboardName": "LaunchScreen",
  "NSAppTransportSecurity": ["NSAllowsArbitraryLoads": true],
  "UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"]
]

let project = Project.make(
  name: "App",
  targets: [
    .target(
      name: "TellingMe-iOS",
      destinations: [.iPhone],
      product: .app,
      bundleId: Const.appBundleId,
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      infoPlist: .extendingDefault(with: infoPlist),
      sources: [Const.sourceFilePath],
      resources: [Const.resourceFilePath],
      dependencies: [
        .project(
            target: "AppFeatureKit",
            path: .relativeToRoot("Projects/AppFeature/AppFeatureKit"),
            condition: .when(.all)
        ),
        .external(name: "KakaoSDKCommon", condition: .when(.all))
      ]
    )
  ]
)
