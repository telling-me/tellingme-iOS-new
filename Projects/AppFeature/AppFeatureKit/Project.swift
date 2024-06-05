import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.make(
  name: "Root",
  targets: [
    .target(
      name: "RootScene",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.appFeatureBundleId + ".RootScene",
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["Targets/Scene/Sources/**"],
      resources: ["Targets/Scene/Resources/**"],
      dependencies: [
        .external(name: "SnapKit", condition: .when(.all)),
        .external(name: "Then", condition: .when(.all))
      ]
    ),
    .target(
        name: "RootSceneTests",
        destinations: .iOS,
        product: .unitTests,
        bundleId: Const.appFeatureBundleId + ".RootSceneTests",
        deploymentTargets: .iOS(Const.minimumTargetVersion),
        infoPlist: .default,
        sources: ["Targets/Scene/Tests/**"],
        dependencies: [.target(name: "RootScene")]
    ),
  ]
)
