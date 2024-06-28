import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.make(
  name: "AppCore",
  targets: [
    .target(
      name: "AppCoreKit",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.appCoreBundleId + ".AppCoreKit",
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["AppCoreKit/**"],
      dependencies: [
        .target(name: "AppCore_Entity", condition: .when(.all)),
        .target(name: "AppCore_DataSource", condition: .when(.all)),
        .target(name: "AppCore_Networking", condition: .when(.all)),
        .target(name: "AppCore_DesignSystem", condition: .when(.all)),
      ]
    ),
    .target(
      name: "AppCore_Entity",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.appCoreBundleId + ".Entity",
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["Entity/**"]
    ),
    .target(
      name: "AppCore_DataSource",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.appCoreBundleId + ".DataSource",
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["DataSource/**"]
    ),
    .target(
      name: "AppCore_Networking",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.appCoreBundleId + ".Networking",
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["Networking/**"]
    ),
    .target(
      name: "AppCore_DesignSystem",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.appCoreBundleId + ".DesignSystem",
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["DesignSystem/Sources/**"],
      resources: ["DesignSystem/Resources/**"],
      dependencies: [
        .project(target: "SharedKit", path: "../Shared", condition: .when(.all)),
        .external(name: "SnapKit", condition: .when(.all)),
        .external(name: "Then", condition: .when(.all))
      ]
    )
  ],
  resourceSynthesizers: .default
)
