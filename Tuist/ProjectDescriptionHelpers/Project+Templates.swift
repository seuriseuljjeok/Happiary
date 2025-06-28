//
//  Project+Templates.swift
//  Manifests
//
//  Created by 윤희슬 on 6/23/25.
//

import ProjectDescription

public func makeApp(_ name: String, _ target: [Target]) -> Project {
    Project(
        name: name,
        settings: .settings(
            base: [
                "DEVELOPMENT_TEAM": "72B557RJ7S",
            ]
        ),
        targets: target
    )
}
