import ProjectDescription
import ProjectDescriptionHelpers

private let targets: [Target] = [
    makeModular(
        .Feature,
        .init(
            dependencies: ModuleLayer.Feature.dependencies
        )
    ),
    makeModular(
        .Onboarding,
        .init(
            dependencies: ModuleLayer.Onboarding.dependencies
        )
    ),
    makeModular(
        .Home,
        .init(
            dependencies: ModuleLayer.Home.dependencies
        )
    )
]

private let feature: Project = makeApp(ModuleLayer.Feature.rawValue, targets)
