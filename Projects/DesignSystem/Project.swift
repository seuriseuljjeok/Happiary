import ProjectDescription
import ProjectDescriptionHelpers

private let targets: [Target] = [
    makeModular(
        .DesignSystem,
        .init(
            infoPlist:
                .extendingDefault(with: [
                    "UIAppFonts": [
                        "Fonts/PoorStory-Regular.ttf"
                    ]
                ]),
            settings: .settings(base: [
                "DEFINES_MODULE": "YES"
            ])
        )
    )
]

private let designSystem: Project = makeApp(ModuleLayer.DesignSystem.rawValue, targets)
