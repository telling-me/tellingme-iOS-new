import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.make(
  name: "AppFeatureKit",
  targets: [
    .target(
      name: "AppFeatureKit",
      destinations: [.iPhone],
      product: .staticLibrary,
      bundleId: Const.appFeatureBundleId + ".AppFeatureKit",
      deploymentTargets: .iOS(Const.minimumTargetVersion),
      sources: ["Sources/**"],
      dependencies: [
        .project(target: "RootScene", path: "../Root", condition: .when(.all)),
        .project(target: "LoginScene", path: "../Login", condition: .when(.all)),
        .project(target: "ProfileEditScene", path: "../ProfileEdit", condition: .when(.all))
      ]
    ),
  ]
)
