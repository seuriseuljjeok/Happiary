//
//  Project+Templates.swift
//  Manifests
//
//  Created by 윤희슬 on 6/23/25.
//

import ProjectDescription

public func app(_ name: String) -> Project {
    Project(
        name: name,
        settings: .settings(
            base: [
                "DEVELOPMENT_TEAM": "72B557RJ7S",
            ]
        ),
        targets: [
            appTarget(name),
            appTestTarget(name)
        ]
    )
}
