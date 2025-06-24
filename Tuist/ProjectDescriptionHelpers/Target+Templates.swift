//
//  Target+Templates.swift
//  Manifests
//
//  Created by 윤희슬 on 6/23/25.
//

import ProjectDescription

public func appTarget(_ name: String) -> Target {
    .target(
        name: name,
        destinations: .iOS,
        product: .app,
        bundleId: "io.tuist.\(name)",
        deploymentTargets: .iOS("16.0"),
        infoPlist: .default,
        sources: ["Sources/**"],
        resources: ["Resources/**"],
        dependencies: [
            .external(name: "ComposableArchitecture")
        ]
    )
}


public func appTestTarget(_ name: String) -> Target {
    .target(
        name: "\(name)Tests",
        destinations: .iOS,
        product: .unitTests,
        bundleId: "io.tuist.\(name)Tests",
        infoPlist: .default,
        sources: ["Tests/**"],
        dependencies: [.target(name: name)]
    )
}
