import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.make(
  name: "Shared",
  targets: [
    .target(
      name: "SharedKit",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.sharedKitBundleId,
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["SharedKit/**"],
      dependencies: [
      ]
    ),
    .target(
      name: "UtilKit",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.sharedUtilBundleId,
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["Targets/UtilKit/**"]
    )
  ]
)
