import ProjectDescription
import ProjectDescriptionHelpers

private let targets: [Target] = [
    makeModular(
        .Onboarding,
        .init(
            dependencies: ModuleLayer.Onboarding.dependencies
        )
    )
]

private let onboarding: Project = makeApp(ModuleLayer.Onboarding.rawValue, targets)
