import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
    name: "___VARIABLE_sceneName___",
    targets: [
        .target(
          name: "___VARIABLE_sceneName___Scene",
          destinations: [.iPhone],
          product: .staticLibrary,
          bundleId: Const.appFeatureBundleId + ".___VARIABLE_sceneName___Scene",
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
            name: "___VARIABLE_sceneName___SceneTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: Const.appFeatureBundleId + ".___VARIABLE_sceneName___SceneTests",
            deploymentTargets: .iOS(Const.minimumTargetVersion),
            infoPlist: .default,
            sources: ["Targets/Scene/Tests/**"],
            dependencies: [.target(name: "___VARIABLE_sceneName___Scene")]
        )
    ]
)
