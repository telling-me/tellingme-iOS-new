import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
    name: "ProfileEdit",
    targets: [
        .target(
          name: "ProfileEditScene",
          destinations: [.iPhone],
          product: .staticLibrary,
          bundleId: Const.appFeatureBundleId + ".ProfileEditScene",
          deploymentTargets: .iOS(Const.minimumTargetVersion),
          sources: ["Targets/Scene/Sources/**"],
          resources: ["Targets/Scene/Resources/**"],
          dependencies: [
            .project(target: "AppCoreKit", path: "../../AppCore", condition: .when(.all)),
            .project(target: "SharedKit", path: "../../Shared", condition: .when(.all)),
            .external(name: "SnapKit", condition: .when(.all)),
            .external(name: "Then", condition: .when(.all))
          ]
        ),
        .target(
            name: "ProfileEditSceneTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: Const.appFeatureBundleId + ".ProfileEditSceneTests",
            deploymentTargets: .iOS(Const.minimumTargetVersion),
            infoPlist: .default,
            sources: ["Targets/Scene/Tests/**"],
            dependencies: [.target(name: "ProfileEditScene")]
        )
    ]
)
