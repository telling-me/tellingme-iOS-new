import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
    name: "Login",
    targets: [
        .target(
          name: "LoginScene",
          destinations: [.iPhone],
          product: .staticLibrary,
          bundleId: Const.appFeatureBundleId + ".LoginScene",
          deploymentTargets: .iOS(Const.minimumTargetVersion),
          sources: ["Targets/Scene/Sources/**"],
          resources: ["Targets/Scene/Resources/**"],
          dependencies: [
            .project(target: "AppCoreKit", path: "../../AppCore", condition: .when(.all)),
            .project(target: "SharedKit", path: "../../Shared", condition: .when(.all)),
            .project(target: "ProfileEditScene", path: "../ProfileEdit", condition: .when(.all)),
            .external(name: "SnapKit", condition: .when(.all)),
            .external(name: "Then", condition: .when(.all))
          ]
        ),
        .target(
            name: "LoginSceneTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: Const.appFeatureBundleId + ".LoginSceneTests",
            deploymentTargets: .iOS(Const.minimumTargetVersion),
            infoPlist: .default,
            sources: ["Targets/Scene/Tests/**"],
            dependencies: [.target(name: "LoginScene")]
        )
    ]
)
