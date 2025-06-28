import ProjectDescription
import ProjectDescriptionHelpers

private let targets: [Target] = [
    makeModular(
        .App,
        .init(
            products: .app,
            dependencies: ModuleLayer.App.dependencies,
            infoPlist: .extendingDefault(
                with: ["UILaunchScreen":""])
        )
    ),
    makeTest("App")
]

let project: Project = makeApp(ModuleLayer.App.rawValue, targets)
