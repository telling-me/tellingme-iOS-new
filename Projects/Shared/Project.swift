import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.make(
  name: "Shared",
  targets: [
    .target(
      name: "SharedKit",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.sharedBundleId + ".SharedKit",
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["SharedKit/**"],
      dependencies: [
        .target(name: "Shared_UtilKit", condition: .when(.all)),
        .target(name: "Shared_ProtocolKit", condition: .when(.all)),
      ]
    ),
    .target(
      name: "Shared_UtilKit",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.sharedBundleId + ".UtilKit",
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["Targets/UtilKit/**"],
      dependencies: [
        .target(name: "Shared_ProtocolKit", condition: .when(.all)),
      ]
    ),
    .target(
      name: "Shared_ProtocolKit",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.sharedBundleId + ".ProtocolKit",
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["Targets/ProtocolKit/**"]
    )
  ]
)
