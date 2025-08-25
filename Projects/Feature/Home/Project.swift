//
//  Project.swift
//  Manifests
//
//  Created by 윤희슬 on 8/25/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

private let targets: [Target] = [
    makeModular(
        .Home,
        .init(
            dependencies: ModuleLayer.Home.dependencies
        )
    )
]

private let home: Project = makeApp(ModuleLayer.Home.rawValue, targets)
