import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.make(
  name: "AppCore",
  targets: [
    .target(
      name: "AppCoreKit",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.appCoreKitBundleId,
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["AppCoreKit/**"],
      dependencies: [
        .target(name: "Entity", condition: .when(.all)),
        .target(name: "DataSource", condition: .when(.all)),
        .target(name: "Networking", condition: .when(.all)),
        .target(name: "DesignSystem", condition: .when(.all)),
      ]
    ),
    .target(
      name: "Entity",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.appCoreEntityBundleId,
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["Entity/**"]
    ),
    .target(
      name: "DataSource",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.appCoreDatasourceBundleId,
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["DataSource/**"]
    ),
    .target(
      name: "Networking",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.appCoreNetworkingBundleId,
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["Networking/**"]
    ),
    .target(
      name: "DesignSystem",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.appCoreDesignSystemBundleId,
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["DesignSystem/**"]
    ),
  ]
)
