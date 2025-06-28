//
//  Project.swift
//  Manifests
//
//  Created by 윤희슬 on 6/24/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

private let targets: [Target] = [
    makeModular(
        .Core,
        .init(
            dependencies: ModuleLayer.Core.dependencies
        )
    )
]

private let core: Project = makeApp(ModuleLayer.Core.rawValue, targets)
